use jewelry_management

SET IDENTITY_INSERT Supplier ON;
INSERT INTO Supplier (SupplierID, SupplierName, Email, Phone_Number)
VALUES 
(1, 'Golden Gems Supplier', 'contact@goldengems.com', '0987654321'),
(2, 'Precious Stones Inc.', 'sales@preciousstones.com', '0123456789'),
(3, 'Diamond World', 'info@diamondworld.com', '0345678912'),
(4, 'Luxury Jewels Co.', 'sales@luxuryjewels.com', '0456789123'),
(5, 'Royal Gems Enterprise', 'contact@royalgems.com', '0567891234'),
(6, 'Platinum Paradise', 'info@platinumparadise.com', '0678912345'),
(7, 'Silver Shine Suppliers', 'sales@silvershine.com', '0789123456'),
(8, 'Emerald Elegance', 'contact@emeraldelegance.com', '0891234567'),
(9, 'Ruby Radiance', 'info@rubyradiance.com', '0912345678'),
(10, 'Pearl Perfection', 'sales@pearlperfection.com', '0234567891'),
(11, 'Diamond Elegance', 'contact@diamondelegance.com', '0301234567'),
(12, 'Gleaming Gold', 'sales@gleaminggold.com', '0312345678'),
(13, 'Opulent Opals', 'info@opulentopals.com', '0323456789'),
(14, 'Radiant Rubies', 'sales@radiantrubies.com', '0334567890'),
(15, 'Sparkling Sapphires', 'contact@sparklingsapphires.com', '0345678901'),
(16, 'Glowing Gems', 'info@glowinggems.com', '0356789012'),
(17, 'Majestic Minerals', 'sales@majesticminerals.com', '0367890123'),
(18, 'Lustrous Luxuries', 'contact@lustrousluxuries.com', '0378901234'),
(19, 'Brilliant Beads', 'info@brilliantbeads.com', '0389012345'),
(20, 'Shimmering Stones', 'sales@shimmeringstones.com', '0390123456'),
(21, 'Royal Diamonds', 'info@royaldiamonds.com', '0401234567'),
(22, 'Pearl Paradise', 'contact@pearlparadise.com', '0412345678'),
(23, 'Antique Adornments', 'sales@antiqueadornments.com', '0423456789'),
(24, 'Velvet Violets', 'info@velvetviolets.com', '0434567890'),
(25, 'Golden Grace', 'sales@goldengrace.com', '0445678901'),
(26, 'Enchanted Emeralds', 'contact@enchantedemeralds.com', '0456789012'),
(27, 'Glistening Garnets', 'info@glisteninggarnets.com', '0467890123'),
(28, 'Dazzling Diamonds', 'sales@dazzlingdiamonds.com', '0478901234'),
(29, 'Moonlight Metals', 'contact@moonlightmetals.com', '0489012345'),
(30, 'Sunlit Silver', 'info@sunlitsilver.com', '0490123456');
SET IDENTITY_INSERT Supplier OFF;

--
INSERT INTO Supplier_Address (SupplierID, Street, City, State, Country, PostalCode)
VALUES 
(1, '123 Jewelry Street', 'Ho Chi Minh City', 'Long Ba Phu Tho', 'Vietnam', '700000'),
(2, '456 Gem Avenue', 'Hanoi', 'Ba Dinh', 'Vietnam', '100000'),
(3, '789 Diamond Road', 'Da Nang', 'Hai Chau', 'Vietnam', '550000'),
(4, '321 Luxury Lane', 'Can Tho', 'Ninh Kieu', 'Vietnam', '900000'),
(5, '654 Royal Street', 'Hue', 'Thua Thien', 'Vietnam', '530000'),
(6, '987 Platinum Plaza', 'Nha Trang', 'Khanh Hoa', 'Vietnam', '650000'),
(7, '246 Silver Circle', 'Vung Tau', 'Ba Ria', 'Vietnam', '780000'),
(8, '135 Emerald Road', 'Hai Phong', 'Hong Bang', 'Vietnam', '180000'),
(9, '802 Ruby Lane', 'Bien Hoa', 'Dong Nai', 'Vietnam', '810000'),
(10, '569 Pearl Street', 'Qui Nhon', 'Binh Dinh', 'Vietnam', '820000'),
(11, '200 Gem Lane', 'Ho Chi Minh City', 'Binh Tan', 'Vietnam', '700001'),
(12, '250 Diamond Avenue', 'Hanoi', 'Dong Da', 'Vietnam', '100001'),
(13, '300 Ruby Street', 'Da Nang', 'Thanh Khe', 'Vietnam', '550001'),
(14, '350 Sapphire Road', 'Can Tho', 'Binh Thuy', 'Vietnam', '900001'),
(15, '400 Pearl Plaza', 'Hue', 'Phu Vang', 'Vietnam', '530001'),
(16, '450 Emerald Drive', 'Nha Trang', 'Vinh Nguyen', 'Vietnam', '650001'),
(17, '500 Topaz Circle', 'Vung Tau', 'Thang Tam', 'Vietnam', '780001'),
(18, '550 Quartz Boulevard', 'Hai Phong', 'Ngo Quyen', 'Vietnam', '180001'),
(19, '600 Garnet Square', 'Bien Hoa', 'Tan Phong', 'Vietnam', '810001'),
(20, '650 Zircon Lane', 'Qui Nhon', 'An Nhon', 'Vietnam', '820001'),
(21, '700 Amber Street', 'Ho Chi Minh City', 'Go Vap', 'Vietnam', '700002'),
(22, '750 Opal Avenue', 'Hanoi', 'Hai Ba Trung', 'Vietnam', '100002'),
(23, '800 Coral Road', 'Da Nang', 'Son Tra', 'Vietnam', '550002'),
(24, '850 Moonstone Plaza', 'Can Tho', 'O Mon', 'Vietnam', '900002'),
(25, '900 Sunstone Drive', 'Hue', 'Huong Thuy', 'Vietnam', '530002'),
(26, '950 Peridot Circle', 'Nha Trang', 'Cam Ranh', 'Vietnam', '650002'),
(27, '1000 Amethyst Boulevard', 'Vung Tau', 'Long Hai', 'Vietnam', '780002'),
(28, '1050 Turquoise Square', 'Hai Phong', 'Le Chan', 'Vietnam', '180002'),
(29, '1100 Jade Lane', 'Bien Hoa', 'Trang Dai', 'Vietnam', '810002'),
(30, '1150 Onyx Street', 'Qui Nhon', 'Phu Cat', 'Vietnam', '820002');


--


SET IDENTITY_INSERT Category ON;
INSERT INTO Category (CategoryID, CategoryName)
VALUES 
(1, 'Necklace'),
(2, 'Ring'),
(3, 'Bracelet'),
(4, 'Earrings'),
(5, 'Watch'),
(6, 'Brooch'),
(7, 'Pendant'),
(8, 'Tiara'),
(9, 'Anklet'),
(10, 'Cufflinks');
SET IDENTITY_INSERT Category OFF;

---

SET IDENTITY_INSERT Customer ON;
INSERT INTO Customer (CustomerID, FullName, PhoneNumber, TaxCode, Cus_address)
VALUES 
(1, 'Nguyen Van A', '0901234567', 'TAX001', '10 Le Loi Street, District 1, Ho Chi Minh City'),
(2, 'Tran Thi B', '0912345678', 'TAX002', '15 Tran Hung Dao Street, Hanoi'),
(3, 'Le Van C', '0923456789', 'TAX003', '20 Bach Dang Street, Da Nang'),
(4, 'Pham Thi D', '0934567890', 'TAX004', '30 Nguyen Trai Street, Can Tho'),
(5, 'Hoang Van E', '0945678901', 'TAX005', '45 Ly Tu Trong Street, Hue'),
(6, 'Vo Thi F', '0956789012', 'TAX006', '60 Hung Vuong Street, Nha Trang'),
(7, 'Tran Van G', '0967890123', 'TAX007', '75 Dong Khoi Street, Vung Tau'),
(8, 'Nguyen Thi H', '0978901234', 'TAX008', '90 Hai Ba Trung Street, Hai Phong'),
(9, 'Le Van I', '0989012345', 'TAX009', '105 Nguyen Ai Quoc Street, Bien Hoa'),
(10, 'Pham Thi J', '0990123456', 'TAX010', '120 Tran Phu Street, Qui Nhon');

SET IDENTITY_INSERT Customer OFF;
--
SET IDENTITY_INSERT Employee ON;
INSERT INTO Employee (EmployeeID, EmployeeName, Position, HireDate, Salary)
VALUES 
(1, 'Pham Van D', 'Sales Manager', '2023-01-15', 15000000),
(2, 'Tran Thi E', 'Sales Representative', '2023-03-01', 10000000),
(3, 'Nguyen Van F', 'Customer Service', '2023-02-10', 8000000),
(4, 'Le Thi G', 'Inventory Manager', '2023-04-20', 12000000),
(5, 'Hoang Van H', 'Marketing Specialist', '2023-05-15', 11000000),
(6, 'Vo Thi I', 'Senior Sales Representative', '2023-06-01', 9500000),
(7, 'Tran Van J', 'Technical Support', '2023-07-10', 8500000),
(8, 'Nguyen Thi K', 'Store Manager', '2023-08-15', 14000000),
(9, 'Le Van L', 'Sales Consultant', '2023-09-01', 9000000),
(10, 'Pham Thi M', 'Customer Relations', '2023-10-10', 8200000);
SET IDENTITY_INSERT Employee OFF;

--
delete from Jewelry
SET IDENTITY_INSERT Jewelry ON;
INSERT INTO Jewelry (JewelryID, Name, CategoryID, Material, ImageURL, Weight, Price, StockQuantity, SupplierID)
VALUES 
(1, 'Diamond Solitaire Necklace', 1, 'Gold 18K', 'necklace1.jpg', 5.5, 25000000, 10, 1),
(2, 'Ruby Engagement Ring', 2, 'Platinum', 'ring1.jpg', 3.2, 35000000, 5, 2),
(3, 'Silver Charm Bracelet', 3, 'Silver 925', 'bracelet1.jpg', 2.8, 8000000, 15, 3),
(4, 'Pearl Drop Earrings', 4, 'Gold 14K', 'earrings1.jpg', 1.5, 12000000, 20, 1),
(5, 'Diamond Tennis Bracelet', 3, 'White Gold', 'bracelet2.jpg', 4.7, 45000000, 8, 4),
(6, 'Emerald Cocktail Ring', 2, 'Gold 18K', 'ring2.jpg', 3.0, 30000000, 12, 5),
(7, 'Sapphire Pendant Necklace', 7, 'Platinum', 'pendant1.jpg', 2.5, 28000000, 15, 6),
(8, 'Pearl Stud Earrings', 4, 'Silver 925', 'earrings2.jpg', 0.8, 6000000, 25, 7),
(9, 'Rose Gold Bangle', 3, 'Rose Gold', 'bracelet3.jpg', 3.5, 18000000, 18, 8),
(10, 'Diamond Halo Engagement Ring', 2, 'White Gold', 'ring3.jpg', 2.8, 40000000, 10, 9);
SET IDENTITY_INSERT Jewelry OFF;
SET IDENTITY_INSERT Jewelry ON;

INSERT INTO Jewelry (JewelryID, Name, CategoryID, Material, ImageURL, Weight, Price, StockQuantity, SupplierID)
VALUES 
(11, 'Gold Diamond Ring', 2, 'Gold 18K', 'ring4.jpg', 3.1, 42000000, 6, 1),
(12, 'Platinum Wedding Band', 2, 'Platinum', 'ring5.jpg', 2.0, 15000000, 8, 2),
(13, 'Silver Heart Necklace', 1, 'Silver 925', 'necklace2.jpg', 4.2, 9000000, 10, 3),
(14, 'Emerald Stud Earrings', 4, 'Gold 14K', 'earrings3.jpg', 1.3, 10000000, 12, 4),
(15, 'Ruby Drop Necklace', 1, 'White Gold', 'necklace3.jpg', 3.5, 23000000, 5, 5),
(16, 'Sapphire Bracelet', 3, 'Rose Gold', 'bracelet4.jpg', 4.1, 25000000, 7, 6),
(17, 'Gold Hoop Earrings', 4, 'Gold 18K', 'earrings4.jpg', 2.2, 18000000, 15, 7),
(18, 'Platinum Chain Necklace', 1, 'Platinum', 'necklace4.jpg', 5.0, 28000000, 9, 8),
(19, 'Silver Bangle Bracelet', 3, 'Silver 925', 'bracelet5.jpg', 3.0, 12000000, 20, 9),
(20, 'Diamond Pendant Necklace', 1, 'White Gold', 'pendant2.jpg', 3.8, 32000000, 7, 10),
(21, 'Pearl Choker Necklace', 1, 'Gold 14K', 'necklace5.jpg', 4.0, 17000000, 6, 1),
(22, 'Emerald Cocktail Earrings', 4, 'Platinum', 'earrings5.jpg', 1.7, 22000000, 8, 2),
(23, 'Sapphire Cluster Ring', 2, 'White Gold', 'ring6.jpg', 2.9, 35000000, 5, 3),
(24, 'Gold Chain Bracelet', 3, 'Gold 18K', 'bracelet6.jpg', 3.5, 14000000, 10, 4),
(25, 'Diamond Tennis Necklace', 1, 'White Gold', 'necklace6.jpg', 6.0, 50000000, 4, 5),
(26, 'Ruby and Diamond Ring', 2, 'Platinum', 'ring7.jpg', 3.6, 40000000, 3, 6),
(27, 'Silver Infinity Necklace', 1, 'Silver 925', 'necklace7.jpg', 3.9, 13000000, 12, 7),
(28, 'Gold Twist Bangle', 3, 'Gold 14K', 'bracelet7.jpg', 3.8, 16000000, 15, 8),
(29, 'Diamond Hoop Earrings', 4, 'White Gold', 'earrings6.jpg', 2.5, 28000000, 6, 9),
(30, 'Platinum Solitaire Ring', 2, 'Platinum', 'ring8.jpg', 2.7, 34000000, 8, 10);

SET IDENTITY_INSERT Jewelry OFF;

--
delete from OrderDetails
delete from Warranty
DELETE FROM Orders;
--


    -- Đơn hàng 1
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (1, 2, 5000000), (2, 1, 7000000), (3, 3, 4000000);
    EXEC AddOrder 1, 'Credit Card',1, @OrderDetails;
	--
	
    -- Đơn hàng 2
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (4, 1, 15000000), (5, 2, 8000000);
    EXEC AddOrder 2, 'Bank Transfer',1, @OrderDetails;

    -- Đơn hàng 3
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (6, 1, 12000000), (7, 3, 3000000);
    EXEC AddOrder 3, 'Cash',2, @OrderDetails;

    -- Đơn hàng 4
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (8, 1, 20000000), (9, 2, 10000000), (10, 1, 15000000);
    EXEC AddOrder 4, 'Digital Wallet',3, @OrderDetails;

    -- Đơn hàng 5
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (11, 1, 5000000), (12, 2, 9000000);
    EXEC AddOrder 5, 'Credit Card',4, @OrderDetails;

    -- Đơn hàng 6
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (13, 2, 11000000), (14, 1, 7000000);
    EXEC AddOrder 6, 'Bank Transfer',3, @OrderDetails;

    -- Đơn hàng 7
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (15, 1, 3000000), (16, 2, 4500000);
    EXEC AddOrder 7, 'Cash',5, @OrderDetails;

    -- Đơn hàng 8
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (17, 3, 6000000), (18, 1, 12000000);
    EXEC AddOrder 8, 'Digital Wallet',6, @OrderDetails;

    -- Đơn hàng 9
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (19, 1, 4000000), (20, 2, 10000000);
    EXEC AddOrder 9, 'Credit Card',8, @OrderDetails;

    -- Đơn hàng 10
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (21, 1, 22000000), (22, 1, 13000000);
    EXEC AddOrder 10, 'Bank Transfer',7, @OrderDetails;

    -- Đơn hàng 11
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (23, 2, 17000000), (24, 1, 9000000);
    EXEC AddOrder 1, 'Credit Card',5, @OrderDetails;

    -- Đơn hàng 12
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (25, 3, 5000000), (26, 1, 8000000);
    EXEC AddOrder 2, 'Bank Transfer', 2,@OrderDetails;

    -- Đơn hàng 13
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (27, 2, 9000000), (28, 1, 14000000);
    EXEC AddOrder 3, 'Cash',3, @OrderDetails;

    -- Đơn hàng 14
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (29, 1, 18000000), (30, 2, 6000000);
    EXEC AddOrder 4, 'Digital Wallet', 7,@OrderDetails;

    -- Đơn hàng 15
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (1, 3, 5000000), (5, 2, 7000000);
    EXEC AddOrder 5, 'Credit Card',1, @OrderDetails;

    -- Đơn hàng 16
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (10, 2, 11000000), (15, 1, 7500000);
    EXEC AddOrder 6, 'Bank Transfer',9,@OrderDetails;

    -- Đơn hàng 17
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (17, 1, 3000000), (20, 2, 4500000);
    EXEC AddOrder 7, 'Cash',3, @OrderDetails;

    -- Đơn hàng 18
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (25, 3, 8000000), (28, 1, 12000000);
    EXEC AddOrder 8, 'Digital Wallet',6, @OrderDetails;

    -- Đơn hàng 19
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (3, 1, 5000000), (7, 2, 10000000);
    EXEC AddOrder 9, 'Credit Card',8,@OrderDetails;

    -- Đơn hàng 20
	DECLARE @OrderDetails OrderDetailsType;
    DELETE FROM @OrderDetails;
    INSERT INTO @OrderDetails (JewelryID, Quantity, UnitPrice) VALUES 
    (11, 2, 12000000), (22, 1, 13000000);
    EXEC AddOrder 10, 'Bank Transfer',7, @OrderDetails;


	--
	SET IDENTITY_INSERT Service ON;
INSERT INTO Service (ServiceID, CustomerID, ServiceDate, ServicePrice, ServiceDescription, EmployeeID)
VALUES 
(1, 1, '2024-03-25', 500000, 'Jewelry Cleaning', 3),
(2, 2, '2024-03-26', 1000000, 'Ring Resizing', 2),
(3, 3, '2024-03-27', 750000, 'Pendant Polishing', 7),
(4, 4, '2024-03-28', 600000, 'Bracelet Repair', 5),
(5, 5, '2024-03-29', 850000, 'Gemstone Replacement', 1),
(6, 6, '2024-03-30', 400000, 'Chain Fixing', 8),
(7, 7, '2024-04-01', 950000, 'Diamond Setting', 4),
(8, 8, '2024-04-02', 500000, 'Earring Adjustment', 6),
(9, 9, '2024-04-03', 700000, 'Watch Battery Replacement', 9),
(10, 10, '2024-04-04', 550000, 'Jewelry Engraving', 10),
(11, 1, '2024-04-05', 650000, 'Clasp Repair', 2),
(12, 2, '2024-04-06', 1200000, 'Stone Setting', 1),
(13, 3, '2024-04-07', 800000, 'Necklace Repair', 3),
(14, 4, '2024-04-08', 700000, 'Bracelet Cleaning', 5),
(15, 5, '2024-04-09', 900000, 'Ring Polishing', 6),
(16, 6, '2024-04-10', 450000, 'Earring Repair', 8),
(17, 7, '2024-04-11', 1100000, 'Diamond Polishing', 4),
(18, 8, '2024-04-12', 550000, 'Watch Repair', 9),
(19, 9, '2024-04-13', 750000, 'Jewelry Inspection', 10),
(20, 10, '2024-04-14', 600000, 'Chain Repair', 7),
(21, 1, '2024-04-15', 800000, 'Pearl Restringing', 2),
(22, 2, '2024-04-16', 1300000, 'Custom Engraving', 1),
(23, 3, '2024-04-17', 900000, 'Gold Plating', 3),
(24, 4, '2024-04-18', 750000, 'Silver Polishing', 5),
(25, 5, '2024-04-19', 1000000, 'Gemstone Resetting', 6);

SET IDENTITY_INSERT Service OFF;
