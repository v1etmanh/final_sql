use jewelry_management

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
--1 sau khi update thì dữ liệu sẽ được lưu vào ngay bảng history nếu có sự thay đổi gi