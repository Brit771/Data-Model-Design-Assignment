CREATE TABLE Riders (
    RiderId INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(20)UNIQUE NOT NULL,
    LicenseNumber VARCHAR(50) UNIQUE
);

CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY AUTO_INCREMENT,
    LicensePlate VARCHAR(20) UNIQUE,
    Make VARCHAR(50),
    Model VARCHAR(50),
    VehicleType ENUM('SUV', 'Sedan', 'Minivan') DEFAULT 'sedan'
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    RiderID INT,
    RequestTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    OrderStatus ENUM('Pending', 'Accepted', 'Completed', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (RiderID) REFERENCES Riders(RiderID) ON DELETE CASCADE
);

CREATE TABLE Rides (
    RideID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT NOT NULL,
    RiderID INT NOT NULL,
    DriverID INT NOT NULL,
    VehicleID INT NOT NULL,
    PickupLocation VARCHAR(255)  NOT NULL, 
    DropoffLocation VARCHAR(255)  NOT NULL,
    StartTime DATETIME,
    EndTime DATETIME,
    Distance DECIMAL(10, 2), -- assuming distance is in kilometers or miles
    RideStatus ENUM('In Progress', 'Completed', 'Cancelled') DEFAULT 'In Progress',
    TotalFare DECIMAL(10, 2) -- assuming TotalFare in NIS
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (RiderID) REFERENCES Riders(RiderID) ON DELETE CASCADE,
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID) ON DELETE CASCADE,
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID) ON DELETE CASCADE
);


CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    RideID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentStatus ENUM('Pending', 'Completed', 'Failed') DEFAULT 'Pending',
    PaymentMethod ENUM('Credit Card', 'Cash') NOT NULL,
    PaymentTime DATETIME DEFAULT CURRENT_TIMESTAMP
    FOREIGN KEY (RideID) REFERENCES Rides(RideID) ON DELETE CASCADE
    FOREIGN KEY (Amount) REFERENCES Rides(TotalFare) ON DELETE CASCADE
);


