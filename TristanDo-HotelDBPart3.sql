USE TristanDoHotelDB;

-- Insert data into Guest table
INSERT INTO Guest (GuestID, FirstName, LastName, Address, City, State, ZIP, Phone) VALUES
(1, 'Your', 'Name', '123 Main St', 'San Diego', 'CA', '92101', '555-123-4567'),
(2, 'Mack', 'Simmer', '379 Old Shore Street', 'Council Bluffs', 'IA', '51501', '291-553-0508'),
(3, 'Bettyann', 'Seery', '750 Wintergreen Dr.', 'Wasilla', 'AK', '99654', '478-277-9632'),
(4, 'Duane', 'Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', '78552', '308-494-0198'),
(5, 'Karie', 'Yang', '9378 W. Augusta Ave.', 'West Deptford', 'NJ', '08096', '214-730-0298'),
(6, 'Aurore', 'Lipton', '762 Wild Rose Street', 'Huntington', 'WV', '25701', '377-507-0974'),
(7, 'Zachery', 'Luechtefeld', '7 Poplar Dr.', 'Arvada', 'CO', '80003', '814-485-2615'),
(8, 'Jeremiah', 'Pendergrass', '70 Oakwood St.', 'Zion', 'IL', '60099', '279-491-0960'),
(9, 'Walter', 'Holaway', '7556 Arrowhead St.', 'Cumberland', 'RI', '02864', '446-396-6785'),
(10, 'Wilfred', 'Vise', '77 West Surrey Street', 'Oswego', 'NY', '13126', '834-727-1001'),
(11, 'Maritza', 'Tilton', '939 Linda Rd.', 'Burke', 'VA', '22015', '446-351-6860'),
(12, 'Joleen', 'Tison', '87 Queen St.', 'Drexel Hill', 'PA', '19026', '231-893-2755');

-- Insert data into RoomType table
INSERT INTO RoomType (RoomTypeID, RoomTypeName, StandardOccupancy, MaximumOccupancy, BasePrice, ExtraPerson) VALUES
(1, 'Single', 1, 1, 149.99, NULL),
(2, 'Double', 2, 2, 174.99, NULL),
(3, 'Suite', 2, 4, 199.99, 10.00),
(4, 'Double Queen', 2, 4, 174.99, 10.00),
(5, 'King', 2, 2, 184.99, NULL);

-- Insert data into Room table
INSERT INTO Room (RoomNumber, RoomTypeID, ADAAccessible, HasJacuzzi) VALUES
(201, 5, false, true),
(202, 5, true, false),
(203, 5, false, true),
(204, 5, true, false),
(205, 3, false, true),
(206, 3, true, false),
(207, 4, false, false),
(208, 4, true, false),
(301, 5, false, true),
(302, 5, true, false),
(303, 5, false, true),
(304, 5, true, false),
(305, 3, false, true),
(306, 3, true, false),
(307, 4, false, false),
(308, 4, true, false),
(401, 2, false, true),
(402, 2, true, false);

-- Insert data into Reservation table
INSERT INTO Reservation (ReservationID, GuestID, StartDate, EndDate, NumberOfAdults, NumberOfChildren, TotalRoomCost) VALUES
(1, 2, '2023-02-02', '2023-02-04', 1, 0, 299.98),
(2, 3, '2023-02-05', '2023-02-10', 2, 1, 999.95),
(3, 4, '2023-02-22', '2023-02-24', 2, 0, 349.98),
(4, 5, '2023-03-06', '2023-03-07', 2, 2, 199.99),
(5, 1, '2023-03-17', '2023-03-20', 1, 1, 524.97),
(6, 6, '2023-03-18', '2023-03-23', 3, 0, 924.95),
(7, 7, '2023-03-29', '2023-03-31', 2, 2, 349.98),
(8, 8, '2023-03-31', '2023-04-05', 2, 0, 874.95),
(9, 9, '2023-04-09', '2023-04-13', 1, 0, 799.96),
(10, 10, '2023-04-23', '2023-04-24', 1, 1, 174.99),
(11, 11, '2023-05-30', '2023-06-02', 2, 4, 1199.97),
(12, 12, '2023-06-10', '2023-06-14', 2, 0, 599.96),
(13, 12, '2023-06-10', '2023-06-14', 1, 0, 599.96),
(14, 6, '2023-06-17', '2023-06-18', 3, 0, 184.99),
(15, 1, '2023-06-28', '2023-07-02', 2, 0, 699.96),
(16, 9, '2023-07-13', '2023-07-14', 1, 0, 184.99),
(17, 10, '2023-07-18', '2023-07-21', 3, 2, 1259.97),
(18, 3, '2023-07-28', '2023-07-29', 2, 1, 199.99),
(19, 3, '2023-08-30', '2023-09-01', 1, 0, 349.98),
(20, 2, '2023-09-16', '2023-09-17', 2, 0, 149.99),
(21, 5, '2023-09-13', '2023-09-15', 2, 2, 399.98),
(22, 4, '2023-11-22', '2023-11-25', 2, 2, 1199.97),
(23, 2, '2023-11-22', '2023-11-25', 2, 0, 449.97),
(24, 2, '2023-11-22', '2023-11-25', 2, 2, 599.97),
(25, 11, '2023-12-24', '2023-12-28', 2, 0, 699.96);

-- Insert data into RoomReservation table
INSERT INTO RoomReservation (ReservationID, RoomNumber) VALUES
(1, 308),
(2, 203),
(3, 305),
(4, 201),
(5, 307),
(6, 302),
(7, 202),
(8, 304),
(9, 301),
(10, 207),
(11, 401),
(12, 206),
(13, 208),
(14, 304),
(15, 205),
(16, 204),
(17, 401),
(18, 303),
(19, 305),
(20, 208),
(21, 203),
(22, 401),
(23, 206),
(24, 301),
(25, 302);

-- Delete statements for Jeremiah Pendergrass and his reservations
-- First delete from RoomReservation table
DELETE FROM RoomReservation
WHERE ReservationID IN (SELECT ReservationID FROM Reservation WHERE GuestID = 8);

-- Then delete from Reservation table
DELETE FROM Reservation
WHERE GuestID = 8;

-- Finally delete from Guest table
DELETE FROM Guest
WHERE GuestID = 8;