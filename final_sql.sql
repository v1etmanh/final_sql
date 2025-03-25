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
    SupplierID INT NOT NULL unique,
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
    Status NCHAR(20) CHECK(Status IN ( 'ACTIVE', 'EXPIRED')),
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
);--á 
