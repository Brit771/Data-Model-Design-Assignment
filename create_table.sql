CREATE TABLE Riders (
    RiderId INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    PhoneNumber VARCHAR(15),
    PaymentMethod ENUM('Credit Card', 'Cash') NOT NULL -- ?????
);

CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(20),
    LicenseNumber VARCHAR(50) UNIQUE
);

CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY AUTO_INCREMENT,
    Make VARCHAR(50),
    Model VARCHAR(50),
    LicensePlate VARCHAR(20) UNIQUE,
    VehicleType ENUM('SUV', 'sedan') DEFAULT 'sedan', -- ???
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    RiderID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    OrderStatus ENUM('Pending', 'Accepted', 'Completed', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (RiderID) REFERENCES Riders(RiderID) ON DELETE CASCADE
);

CREATE TABLE Rides (
    RideID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    RiderID INT,
    DriverID INT,
    VehicleID INT,
    PickupLocation VARCHAR(255),
    DropoffLocation VARCHAR(255),
    StartTime TIMESTAMP,
    EndTime TIMESTAMP,
    Distance DECIMAL(10, 2), -- assuming distance is in kilometers or miles
    RideStatus ENUM('In Progress', 'Completed', 'Cancelled') DEFAULT 'In Progress',
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (RiderID) REFERENCES Riders(RiderID) ON DELETE CASCADE,
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID) ON DELETE CASCADE,
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID) ON DELETE CASCADE
);


CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    RideID INT,
    PaymentStatus ENUM('Pending', 'Completed', 'Failed') DEFAULT 'Pending',
    Amount DECIMAL(10, 2),
    PaymentTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PaymentMethod ENUM('Credit Card', 'Cash') NOT NULL -- ?????
    FOREIGN KEY (RideID) REFERENCES Rides(RideID) ON DELETE CASCADE
);


