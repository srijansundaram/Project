create database GetawayMansion;
use GetawayMansion;
CREATE TABLE admin (
    AdminID INT PRIMARY KEY AUTO_INCREMENT,  -- Unique identifier for each admin
    FirstName VARCHAR(50) NOT NULL,          -- First name of the admin
    MiddleName VARCHAR(50),                   -- Middle name (optional)
    LastName VARCHAR(50) NOT NULL,           -- Last name of the admin
    Password VARCHAR(255) NOT NULL            -- Password
);
CREATE TABLE receptionist (
    ReceptionistId INT PRIMARY KEY AUTO_INCREMENT,  -- Unique identifier for each receptionist
    FirstName VARCHAR(50) NOT NULL,                 -- First name of the receptionist
    MiddleName VARCHAR(50),                          -- Middle name (optional)
    LastName VARCHAR(50) NOT NULL                    -- Last name of the receptionist
);
CREATE TABLE customer (
    CustomerId INT PRIMARY KEY AUTO_INCREMENT,  -- Unique identifier for each customer
    FirstName VARCHAR(50) NOT NULL,             -- First name of the customer
    MiddleName VARCHAR(50),                      -- Middle name (optional)
    LastName VARCHAR(50) NOT NULL,               -- Last name of the customer
    MobileNumber VARCHAR(15),                    -- Mobile number (assuming a max length of 15 digits)
    Address VARCHAR(255)                         -- Address of the customer
);
CREATE TABLE rate (
    RateID INT PRIMARY KEY AUTO_INCREMENT,   -- Unique identifier for the rate
    RoomType VARCHAR(50) NOT NULL UNIQUE,    -- Type of room (e.g., Standard, Premium)
    Rate DECIMAL(10, 2) NOT NULL              -- Rate for the room type (e.g., amount per day)
);
CREATE TABLE room (
    RoomNumber INT PRIMARY KEY,               -- Unique identifier for each room
    Floor INT NOT NULL,                       -- Floor number where the room is located
    RoomType VARCHAR(50) NOT NULL,           -- Type of room (e.g., Standard, Premium)
    FOREIGN KEY (RoomType) REFERENCES rate(RoomType)  -- Foreign key referencing room type
);
CREATE TABLE transactiondetail ( 
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    ReceptionistID INT,
    StartDate DATETIME,
    EndDate DATETIME,
    PaymentType VARCHAR(50),
    RoomType VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID),
    FOREIGN KEY (ReceptionistID) REFERENCES receptionist(ReceptionistID),
    FOREIGN KEY (RoomType) REFERENCES rate(RoomType)  -- Assuming PaymentType matches rates table
);


