use jewelry_management

go
CREATE TRIGGER trg_Jewelry_Price_Update
ON Jewelry
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Price)
    BEGIN
        INSERT INTO JewelryPriceHistory (JewelryID, OldPrice, NewPrice, ChangeDate)
        SELECT d.JewelryID, d.Price, i.Price, GETDATE()
        FROM deleted d
        JOIN inserted i ON d.JewelryID = i.JewelryID
        WHERE d.Price <> i.Price;
    END
END;
--trigger khi order mà có sl vuwotj quá sl sp 
go
CREATE TRIGGER trg_Check_Stock_Before_Order
ON OrderDetails
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM inserted i
        JOIN Jewelry j ON i.JewelryID = j.JewelryID
        WHERE i.Quantity > j.StockQuantity
    )
    BEGIN
        RAISERROR ('Số lượng đặt hàng vượt quá số lượng trong kho!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

--tự động giảm số lượng hàng trong kho sau khi đặt hàng 
go
CREATE TRIGGER trg_Update_Stock_After_Order
ON OrderDetails
AFTER INSERT
AS
BEGIN
    UPDATE j
    SET j.StockQuantity = j.StockQuantity - i.Quantity
    FROM Jewelry j
    JOIN inserted i ON j.JewelryID = i.JewelryID;
END;

--tự động cập nhật sau khi hết bảo hành
go
CREATE TRIGGER trg_Auto_Update_Warranty_Status
ON Warranty
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE Warranty
    SET Status = 'EXPIRED'
    WHERE EndDate < GETDATE() AND Status <> 'EXPIRED';
END;
--đảm bảo ngày bảo hành hợp lí 
go
CREATE TRIGGER trg_Validate_Warranty_Dates ON Warranty
Instead of INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM inserted WHERE StartDate > EndDate
    )
    BEGIN
        RAISERROR ('Ngày bắt đầu bảo hành không thể lớn hơn ngày kết thúc!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
-- nếu hàng bị hủy thì sao -:> thì số luwongjh hàng sẽ dc hoàn vì sp sẽ dc trả về
go
CREATE TRIGGER trg_Restore_Stock_After_Cancel
ON Orders
AFTER UPDATE
AS
BEGIN
    IF UPDATE(Status) AND EXISTS (
        SELECT 1 FROM inserted WHERE Status = 'CANCELED'
    )
    BEGIN
        UPDATE j
        SET j.StockQuantity = j.StockQuantity + od.Quantity
        FROM Jewelry j
        JOIN OrderDetails od ON j.JewelryID = od.JewelryID
        JOIN inserted i ON od.OrderID = i.OrderID
        WHERE i.Status = 'CANCELED';
    END
END;
-- 
--create thu tuc
go
CREATE TYPE OrderDetailsType AS TABLE (
    JewelryID INT,
    Quantity INT,
    UnitPrice DECIMAL(18,2)
);

go
CREATE PROCEDURE AddOrder
    @CustomerID INT,
    @PaymentMethod NVARCHAR(50),
	@Employid int,
    @OrderDetails OrderDetailsType READONLY
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewOrderID INT;

    -- Bước 1: Tạo đơn hàng mới
    INSERT INTO Orders (CustomerID, OrderDate, PaymentMethod,EmployeeID, TotalAmount, Status)
    VALUES (@CustomerID, GETDATE(), @PaymentMethod,@Employid, 0, 'PENDING');

    -- Lấy OrderID vừa tạo
    SET @NewOrderID = SCOPE_IDENTITY();

    -- Bước 2: Chèn tất cả sản phẩm vào OrderDetails một lần
    INSERT INTO OrderDetails (OrderID, JewelryID, Quantity, UnitPrice)
    SELECT @NewOrderID, JewelryID, Quantity, UnitPrice
    FROM @OrderDetails;

    -- Bước 3: Cập nhật tổng tiền đơn hàng
    UPDATE Orders
    SET TotalAmount = (SELECT SUM(Quantity * UnitPrice) FROM OrderDetails WHERE OrderID = @NewOrderID)
    WHERE OrderID = @NewOrderID;

    -- Trả về OrderID mới
    SELECT @NewOrderID AS NewOrderID;
END;
-- tạo trigger để chèn vào khi  thêm 1 đơn đặt hàng thì ta sẽ có 1 giấy bảo hành 
CREATE TRIGGER trg_AfterOrder_Insert
ON OrderDetails
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Warranty (JewelryID, CustomerID, StartDate, EndDate, Status)
    SELECT 
        i.JewelryID,  
        o.CustomerID,  
        GETDATE() AS StartDate,  
        -- Xác định thời gian bảo hành dựa trên giá trị của sản phẩm
        CASE 
            WHEN j.Price < 10000000 THEN DATEADD(MONTH, 6, GETDATE()) 
            WHEN j.Price BETWEEN 10000000 AND 25000000 THEN DATEADD(MONTH, 12, GETDATE())  
            ELSE DATEADD(MONTH, 24, GETDATE())  
        END AS EndDate,
        'ACTIVE'  
    FROM inserted i  
    JOIN Orders o ON i.OrderID = o.OrderID  -- Lấy thông tin khách hàng từ đơn hàng
    JOIN Jewelry j ON i.JewelryID = j.JewelryID; -- Lấy giá sản phẩm

END;