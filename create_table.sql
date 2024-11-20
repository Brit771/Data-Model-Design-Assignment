CREATE TABLE Riders (
    RiderID INT AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(10) NOT NULL,
    PRIMARY KEY (RiderID)
);

CREATE TABLE Vehicles (
    VehicleID INT AUTO_INCREMENT,
    LicensePlate VARCHAR(20) NOT NULL UNIQUE,
    Make VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    VehicleType ENUM('Sedan', 'SUV', 'Truck', 'Van') NOT NULL,
    PRIMARY KEY (VehicleID)
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT,
    RiderID INT NOT NULL,
    RequestTime DATETIME NOT NULL,
    PickupLocation VARCHAR(255) NOT NULL,
    DestinationLocation VARCHAR(255) NOT NULL,
    OrderStatus ENUM('Pending','Accepted' , 'Cancelled' ,'Completed') NOT NULL,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (RiderID) REFERENCES Riders(RiderID)
);

CREATE TABLE DriverOffers (
    OfferID INT AUTO_INCREMENT,
    OrderID INT NOT NULL,
    DriverID INT NOT NULL,
    OfferedAt DATETIME NOT NULL,
    OfferStatus ENUM('Accepted', 'Rejected', 'Pending') NOT NULL,
    AnswerTime DATETIME,
    PRIMARY KEY (OfferID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
    FOREIGN KEY (DriverID) REFERENCES ActiveDrivers(DriverID)
);

CREATE TABLE Rides (
    RideID INT AUTO_INCREMENT,
    OfferID INT NOT NULL,
    ActualPickupLocation VARCHAR(255) NOT NULL,
    DropoffLocation VARCHAR(255) NOT NULL,
    StartTime DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    EndTime DATETIME, -- Populated when the ride ends,
    Distance DECIMAL(10, 2)  DEFAULT 0, -- Updated after ride ends
    RideStatus ENUM('In Progress', 'Completed', 'Cancelled') DEFAULT 'In Progress',
    TotalFare DECIMAL(10, 2) DEFAULT 0, -- Updated after ride ends
    PRIMARY KEY (RideID),
    FOREIGN KEY (OfferID) REFERENCES DriverOffers(OfferID)
);

CREATE TABLE Ratings (
  RatingID INT AUTO_INCREMENT,
  RideID INT NOT NULL,
  Score ENUM('1', '2', '3', '4', '5') NOT NULL,
  PRIMARY KEY (RatingID),
  FOREIGN KEY (RideID) REFERENCES Rides(RideID)
);