INSERT INTO admin (FirstName, MiddleName, LastName, Password) VALUES 
('Rahul', 'Kumar', 'Sharma', 'rahul@123'),
('Priya', 'Anand', 'Gupta', 'priya@456'),
('Ravi', 'Vijay', 'Patel', 'ravi@789'),
('Sita', 'Kiran', 'Iyer', 'sita@321'),
('Amit', 'Rajesh', 'Malhotra', 'amit@654'),
('Nina', 'Sunil', 'Nair', 'nina@987'),
('Deepak', 'Mohit', 'Singh', 'deepak@159'),
('Meera', 'Suresh', 'Reddy', 'meera@753');

INSERT INTO receptionist (FirstName, MiddleName, LastName) VALUES 
('Anjali', 'Suresh', 'Kumar'),
('Vikram', 'Ravi', 'Sharma'),
('Pooja', 'Arun', 'Nair'),
('Karan', 'Dev', 'Patel'),
('Neelam', 'Rakesh', 'Singh'),     
('Ritesh', 'Kumar', 'Jha'),         
('Swati', 'Mohit', 'Desai'),        
('Ajay', 'Raj', 'Mishra');   

INSERT INTO customer (FirstName, MiddleName, LastName, MobileNumber, Address) VALUES 
('Aditi', 'Mehul', 'Desai', '9876543210', '101, Blue Bell Apartments, Mumbai, Maharashtra'),
('Vikrant', 'Ashok', 'Kumar', '8765432109', '202, Sunshine Enclave, Pune, Maharashtra'),
('Sonia', 'Rajiv', 'Bansal', '7654321098', '303, Green Valley, Bengaluru, Karnataka'),
('Rohan', 'Suresh', 'Nair', '6543210987', '404, Happy Homes, Chennai, Tamil Nadu'),
('Neha', 'Pradeep', 'Singh', '5432109876', '505, Whitefield, Hyderabad, Telangana'),
('Tanvi', 'Vijay', 'Sharma', '4321098765', '606, Oakwood Street, Kolkata, West Bengal'),
('Karan', 'Rajesh', 'Iyer', '3210987654', '707, Rose Garden, Ahmedabad, Gujarat'),
('Simran', 'Sahil', 'Mehta', '2109876543', '808, Lotus Avenue, Jaipur, Rajasthan');

INSERT INTO rate (RoomType, Rate) VALUES 
('Standard', 1500.00),
('Premium', 2500.00),
('Luxury', 5000.00),
('Suite', 8000.00),
('Deluxe', 3000.00),
('Economy', 1000.00),
('Family', 3500.00),
('Executive', 4000.00);

INSERT INTO room (RoomNumber, Floor, RoomType) VALUES 
(101, 1, 'Standard'),
(102, 1, 'Premium'),
(201, 2, 'Luxury'),
(202, 2, 'Suite'),
(301, 3, 'Deluxe'),
(302, 3, 'Economy'),
(401, 4, 'Family'),
(402, 4, 'Executive');

INSERT INTO transactiondetail (CustomerID, ReceptionistID, StartDate, EndDate, PaymentType, RoomType) VALUES 
(1, 3, '2024-10-01 12:00:00', '2024-10-20 12:00:00', 'Credit Card', 'Standard'),
(2, 4, '2024-10-03 14:00:00', '2024-10-05 10:00:00', 'Cash', 'Premium'),
(3, 1, '2024-10-05 09:00:00', '2024-10-11 09:00:00', 'UPI', 'Luxury'),
(4, 5, '2024-10-08 10:00:00', '2024-10-09 10:00:00', 'Debit Card', 'Suite'),
(5, 1, '2024-10-10 08:00:00', '2024-10-14 08:00:00', 'Cash', 'Deluxe'),
(6, 2, '2024-10-12 11:00:00', '2024-10-13 11:00:00', 'Credit Card', 'Economy'),
(7, 3, '2024-10-14 15:00:00', '2024-10-15 15:00:00', 'UPI', 'Family'),
(8, 4, '2024-10-16 16:00:00', '2024-10-25 16:00:00', 'Cash', 'Executive');




       

