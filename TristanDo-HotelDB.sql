DROP DATABASE IF EXISTS YourNameHotelDB;


CREATE DATABASE YourNameHotelDB;


USE YourNameHotelDB;


CREATE TABLE Guest (
    GuestID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Address VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State CHAR(2) NOT NULL,
    ZIP VARCHAR(10) NOT NULL,
    Phone VARCHAR(15) NOT NULL
);


CREATE TABLE RoomType (
    RoomTypeID INT PRIMARY KEY AUTO_INCREMENT,
    RoomTypeName VARCHAR(50) NOT NULL,
    StandardOccupancy INT NOT NULL,
    MaximumOccupancy INT NOT NULL,
    BasePrice DECIMAL(10,2) NOT NULL,
    ExtraPerson DECIMAL(10,2) NULL
);


CREATE TABLE Room (
    RoomNumber INT PRIMARY KEY,
    RoomTypeID INT NOT NULL,
    ADAAccessible BOOLEAN NOT NULL,
    HasJacuzzi BOOLEAN NOT NULL,
    FOREIGN KEY (RoomTypeID) REFERENCES RoomType(RoomTypeID)
);


CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY AUTO_INCREMENT,
    GuestID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    NumberOfAdults INT NOT NULL,
    NumberOfChildren INT NOT NULL,
    TotalRoomCost DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID)
);


CREATE TABLE RoomReservation (
    RoomReservationID INT PRIMARY KEY AUTO_INCREMENT,
    ReservationID INT NOT NULL,
    RoomNumber INT NOT NULL,
    FOREIGN KEY (ReservationID) REFERENCES Reservation(ReservationID),
    FOREIGN KEY (RoomNumber) REFERENCES Room(RoomNumber)
);
