USE TristanDoHotelDB;

SELECT 
    CONCAT(g.FirstName, ' ', g.LastName) AS GuestName,
    rr.RoomNumber,
    r.StartDate,
    r.EndDate
FROM Reservation r
JOIN Guest g ON r.GuestID = g.GuestID
JOIN RoomReservation rr ON r.ReservationID = rr.ReservationID
WHERE r.EndDate BETWEEN '2023-07-01' AND '2023-07-31';

/* Results:
GuestName           RoomNumber  StartDate   EndDate
Walter Holaway      204         2023-07-13  2023-07-14
Wilfred Vise        401         2023-07-18  2023-07-21
Bettyann Seery      303         2023-07-28  2023-07-29
*/

SELECT 
    CONCAT(g.FirstName, ' ', g.LastName) AS GuestName,
    rr.RoomNumber,
    r.StartDate,
    r.EndDate
FROM Reservation r
JOIN Guest g ON r.GuestID = g.GuestID
JOIN RoomReservation rr ON r.ReservationID = rr.ReservationID
JOIN Room rm ON rr.RoomNumber = rm.RoomNumber
WHERE rm.HasJacuzzi = true;

/* Results:
GuestName           RoomNumber  StartDate   EndDate
Karie Yang          201         2023-03-06  2023-03-07
Bettyann Seery      203         2023-02-05  2023-02-10
Karie Yang          203         2023-09-13  2023-09-15
Your Name           205         2023-06-28  2023-07-02
Wilfred Vise        401         2023-07-18  2023-07-21
Maritza Tilton      401         2023-11-22  2023-11-25
Bettyann Seery      303         2023-07-28  2023-07-29
Duane Cullison      305         2023-02-22  2023-02-24
Bettyann Seery      305         2023-08-30  2023-09-01
Walter Holaway      301         2023-04-09  2023-04-13
Mack Simmer         301         2023-11-22  2023-11-25
*/

SELECT 
    CONCAT(g.FirstName, ' ', g.LastName) AS GuestName,
    rr.RoomNumber,
    r.StartDate,
    (r.NumberOfAdults + r.NumberOfChildren) AS TotalPeople
FROM Reservation r
JOIN Guest g ON r.GuestID = g.GuestID
JOIN RoomReservation rr ON r.ReservationID = rr.ReservationID
WHERE g.GuestID = 3; -- Bettyann Seery

/* Results:
GuestName           RoomNumber  StartDate   TotalPeople
Bettyann Seery      203         2023-02-05  3
Bettyann Seery      303         2023-07-28  3
Bettyann Seery      305         2023-08-30  1
*/

SELECT 
    rm.RoomNumber,
    r.ReservationID,
    CASE 
        WHEN r.ReservationID IS NOT NULL THEN r.TotalRoomCost
        ELSE NULL
    END AS RoomCost
FROM Room rm
LEFT JOIN RoomReservation rr ON rm.RoomNumber = rr.RoomNumber
LEFT JOIN Reservation r ON rr.ReservationID = r.ReservationID;

/* Results (partial):
RoomNumber  ReservationID  RoomCost
201         4              199.99
202         7              349.98
203         2              999.95
203         21             399.98
204         16             184.99
205         15             699.96
206         12             599.96
206         23             449.97
207         10             174.99
(more rows)
*/

SELECT 
    rm.RoomNumber,
    rt.MaximumOccupancy,
    r.StartDate,
    r.EndDate
FROM Room rm
JOIN RoomType rt ON rm.RoomTypeID = rt.RoomTypeID
JOIN RoomReservation rr ON rm.RoomNumber = rr.RoomNumber
JOIN Reservation r ON rr.ReservationID = r.ReservationID
WHERE rt.MaximumOccupancy >= 3
AND (
    (r.StartDate BETWEEN '2023-04-01' AND '2023-04-30')
    OR (r.EndDate BETWEEN '2023-04-01' AND '2023-04-30')
    OR (r.StartDate < '2023-04-01' AND r.EndDate > '2023-04-30')
);

/* Results:
RoomNumber  MaximumOccupancy  StartDate   EndDate
301         2                 2023-04-09  2023-04-13
401         4                 2023-04-23  2023-04-24
*/

SELECT 
    CONCAT(g.FirstName, ' ', g.LastName) AS GuestName,
    COUNT(r.ReservationID) AS ReservationCount
FROM Guest g
LEFT JOIN Reservation r ON g.GuestID = r.GuestID
GROUP BY g.GuestID, g.FirstName, g.LastName
ORDER BY ReservationCount DESC, g.LastName ASC;

/* Results:
GuestName           ReservationCount
Mack Simmer         4
Bettyann Seery      3
Duane Cullison      2
Walter Holaway      2
Aurore Lipton       2
Your Name           2
Karie Yang          2
Maritza Tilton      1
Joleen Tison        2
Wilfred Vise        2
Zachery Luechtefeld 1
*/

SELECT 
    CONCAT(FirstName, ' ', LastName) AS GuestName,
    CONCAT(Address, ', ', City, ', ', State, ' ', ZIP) AS FullAddress,
    Phone
FROM Guest
WHERE Phone = '214-730-0298'; -- Karie Yang

/* Results:
GuestName     FullAddress                                  Phone
Karie Yang    9378 W. Augusta Ave., West Deptford, NJ 08096    214-730-0298
*/