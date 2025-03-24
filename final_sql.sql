create database jewelry_management
use jewelry_management
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY identity(1,1),
    SupplierName NVARCHAR(50) NOT NULL,
    Email  nvarchar(100) not null unique,--đảm bảo nó là duy nhất
	Phone_Number nvarchar(15) not null  unique,-- đảm bảo là duy nhất 
	
	-- specific hay là làm rõ nơi cung cấp và thông tin liên hệ
);

-- tạo 1 bảng địa chỉ để tối ưu hóa địa chỉ  1 cách kiểu rõ hơn á :)) 
CREATE TABLE Supplier_Address (
    AddressID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierID INT NOT NULL,
    Street VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    State VARCHAR(100) NULL,
    Country VARCHAR(100) NOT NULL,
    PostalCode VARCHAR(20) NULL,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID) ON DELETE CASCADE
);


-- Create Category Table
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY identity(1,1),
    CategoryName NVARCHAR(50) NOT NULL unique -- tôi nghĩ thành phần của trang sức là duy nhất á'
);

-- Create Jewelry Table
CREATE TABLE Jewelry (
    JewelryID INT PRIMARY KEY identity(1,1),
    Name NVARCHAR(50) NOT NULL,
    CategoryID INT not null,
    Material NVARCHAR(50),
	ImageURL NVARCHAR(255),
    Weight DECIMAL(18,2),
    Price DECIMAL(18,2) check(price>=0),-- đảm bảo ko nhầm là giá âm 
    StockQuantity INT,
    SupplierID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

-- Create Customer Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY identity(1,1),
    FullName NVARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL unique,-- số đth là duy nhất ,
    TaxCode VARCHAR(20) unique,
	Cus_address nvarchar(100) not null,
	-- vì có thể sp bị lỗi sau đó ta cần bt dc nơi ở của khách hanfgd để tới sử lí
	--ensure tax code is unique
);

-- Create Orders Table


-- Create OrderDetails Table


-- Create Warranty Table
-- mỗi đơn bảo hành có thể bao gồm tới khách hàng đk cả sp và cả khách hàng 
CREATE TABLE Warranty  (
    WarrantyID INT PRIMARY KEY identity(1,1),
    JewelryID INT not null,
	 CustomerID INT NOT NULL,
    StartDate DATE not null,
    EndDate DATE not null,
	constraint chk_warranty_date  CHECK (EndDate >= StartDate),-- thêm vào để check ngày kết thúc và ngày bắt đầu 
    Status NCHAR(20) CHECK(Status IN ('PENDING', 'ACTIVE', 'EXPIRED')),
    FOREIGN KEY (JewelryID) REFERENCES Jewelry(JewelryID),
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Create Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY identity(1,1),
    EmployeeName NVARCHAR(50) NOT NULL,
    Position NVARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(18,2)
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY identity(1,1),
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(18,2) check(TotalAmount>=0),-- đảm bảo ko âm
	EmployeeId  int ,--add employee id to manage produce  nghiax laf nhân viên nào đã bán sp này
    Status NVARCHAR(50) check(Status in ('PENDING','COMPLETED','CANCELED')),--adding fixed value for status 
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
	 PaymentMethod NVARCHAR(50) not null,--- vì mỗi đơn hàng có thể sẽ  có  cách thanh toán riêng 
	foreign key(EmployeeId) references Employee(EmployeeID)
);
CREATE TABLE OrderDetails (
   
    OrderID INT,
    JewelryID INT,
    Quantity INT check(Quantity>=0),-- đảm bảo ko âm
    UnitPrice DECIMAL(18,2),
   
	primary key(OrderId,JewelryID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (JewelryID) REFERENCES Jewelry(JewelryID)
	--chỉnh sửa để đảm bảo dc primarykey ở đây là duy nhất
);
-- Create Service Table
CREATE TABLE Service (
    ServiceID INT PRIMARY KEY identity(1,1),
    CustomerID INT,
    ServiceDate DATE,
	ServicePrice DECIMAL(18,2) check(ServicePrice>=0),
    ServiceDescription NVARCHAR(255),
	EmployeeID int foreign key(EmployeeID) references Employee(EmployeeID),-- quản lí xem nhân viên nào đã phục vụ khách hàng vs dịch vụ a.b,.c
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
-- theo thời gian các  giá trị từng sp thay đổi :)) nên ta nên lưu nó vào 1 bảng lịch sử
CREATE TABLE JewelryPriceHistory (
    PriceID INT PRIMARY KEY IDENTITY(1,1),  
    JewelryID INT NOT NULL,                 -- ID sản phẩm
    OldPrice DECIMAL(18,2) NOT NULL,        -- Giá cũ
    NewPrice DECIMAL(18,2) NOT NULL,        -- Giá mới
    ChangeDate DATETIME DEFAULT GETDATE(),  -- Ngày thay đổi giá ok
    FOREIGN KEY (JewelryID) REFERENCES Jewelry(JewelryID) ON DELETE CASCADE
);
-- điều này sẽ được hoàn thiện bởi hàm update ngay khi ta thay đổi giá của sp thời nó sẽ tự động lưu vào :))
-- tạo index 
-- giải thích sơ qua vì sao index lại làm tăng tốc độ truy vấn nhé :: vì nó sẽ tổ chức các địa chỉ theo binary search tree nên log(n)
-- các thuộc tính có thể dc tìm kiếm thường xuyên && và tìm kiếm đk thỏa mãn khi thực hiện join
--1 tạo các index cho việc truy vấn các bảng thường xuyên join

CREATE INDEX idx_Jewelry_Category ON Jewelry (CategoryID);
CREATE INDEX idx_Jewelry_Supplier ON Jewelry (SupplierID);

CREATE INDEX idx_Orders_Customer ON Orders (CustomerID);
CREATE INDEX idx_Orders_Employee ON Orders (EmployeeID);

CREATE INDEX idx_OrderDetails_Order ON OrderDetails (OrderID);
CREATE INDEX idx_OrderDetails_Jewelry ON OrderDetails (JewelryID);

CREATE INDEX idx_Warranty_Jewelry ON Warranty (JewelryID);
CREATE INDEX idx_Warranty_Customer ON Warranty (CustomerID);

CREATE INDEX idx_Service_Customer ON Service (CustomerID);
CREATE INDEX idx_Service_Employee ON Service (EmployeeID);

CREATE INDEX idx_SupplierAddress_Supplier ON Supplier_Address (SupplierID);
-- thứ 2 là các thuộc tính thường hay dùng để tìm kiếm 
CREATE INDEX idx_Customer_Phone ON Customer (PhoneNumber);
CREATE INDEX idx_Customer_TaxCode ON Customer (TaxCode);

CREATE INDEX idx_Supplier_Email ON Supplier (Email);
CREATE INDEX idx_Supplier_Phone ON Supplier (Phone_Number);

CREATE INDEX idx_Jewelry_Name ON Jewelry (Name);
CREATE INDEX idx_Employee_Name ON Employee (EmployeeName);
--giá trị của 1 bảng lịch sử thường thay đổi nên ta cx nên tạo index để tìm nhanh lịch sử 
CREATE INDEX idx_JewelryPriceHistory_Jewelry ON JewelryPriceHistory (JewelryID);
CREATE INDEX idx_JewelryPriceHistory_ChangeDate ON JewelryPriceHistory (ChangeDate);
-- ta cx mún đôi khi tìm kiếm dữ liệu theo ngày kiểu như hôm qua ai mua hàng hè 
CREATE INDEX idx_Orders_OrderDate ON Orders (OrderDate);
-- ta cx có thể mún tìm kiêm xem thử các đơn  bảo hành  hàng nào còn hiệu lực ::0 đơn hàng nảo bị hủy.,...
CREATE INDEX idx_Orders_Status ON Orders (Status);
CREATE INDEX idx_Warranty_Status ON Warranty (Status);
-- thêm các trigger  
--1 sau khi update thì dữ liệu sẽ được lưu vào ngay bảng history nếu có sự thay đổi giá 
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
    @OrderDetails OrderDetailsType READONLY
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NewOrderID INT;

    -- Bước 1: Tạo đơn hàng mới
    INSERT INTO Orders (CustomerID, OrderDate, PaymentMethod, TotalAmount, Status)
    VALUES (@CustomerID, GETDATE(), @PaymentMethod, 0, 'PENDING');

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
