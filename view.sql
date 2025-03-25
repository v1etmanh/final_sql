-- VIEW 1: Xem lịch sử giao dịch của khách hàng
use jewelry_management
CREATE VIEW CustomerTransactionHistory AS
SELECT C.CustomerID, C.FullName, O.OrderID, O.OrderDate, O.TotalAmount, O.Status, O.PaymentMethod
FROM Customer C
JOIN Orders O ON C.CustomerID = O.CustomerID;

select * from CustomerTransactionHistory

-- VIEW 2: Xem lịch sử thay đổi giá sản phẩm
CREATE VIEW JewelryPriceChangeHistory AS
SELECT J.JewelryID, J.Name AS JewelryName, PH.OldPrice, PH.NewPrice, PH.ChangeDate
FROM Jewelry J
JOIN JewelryPriceHistory PH ON J.JewelryID = PH.JewelryID;

-- VIEW 3: Danh sách đơn hàng và chi tiết đơn hàng
CREATE VIEW OrderWithDetails AS
SELECT O.OrderID, O.OrderDate, O.TotalAmount, O.Status, OD.JewelryID, J.Name AS JewelryName, OD.Quantity, OD.UnitPrice
FROM Orders O
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Jewelry J ON OD.JewelryID = J.JewelryID;

-- VIEW 4: Thông tin bảo hành và trạng thái bảo hành
CREATE VIEW WarrantyStatus AS
SELECT W.WarrantyID, C.FullName AS CustomerName, J.Name AS JewelryName, W.StartDate, W.EndDate, W.Status
FROM Warranty W
JOIN Customer C ON W.CustomerID = C.CustomerID
JOIN Jewelry J ON W.JewelryID = J.JewelryID;

-- VIEW 5: Danh sách sản phẩm trong kho kèm số lượng và nhà cung cấp
CREATE VIEW InventoryWithSupplier AS
SELECT J.JewelryID, J.Name AS JewelryName, J.StockQuantity, J.Price, S.SupplierName, S.Email, S.Phone_Number
FROM Jewelry J
JOIN Supplier S ON J.SupplierID = S.SupplierID;


