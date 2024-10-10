SELECT * FROM admin;
SELECT * FROM receptionist;
SELECT * FROM customer;
SELECT * FROM room;
SELECT 
    td.TransactionID,
    td.CustomerID,
    td.ReceptionistID,
    td.StartDate,
    td.EndDate,
    td.PaymentType,
    td.RoomType,
    r.Rate,
    DATEDIFF(td.EndDate, td.StartDate) AS DurationDays,
    DATEDIFF(td.EndDate, td.StartDate) * r.Rate AS TotalPayment
FROM 
    transactiondetail td
JOIN 
    rate r ON td.RoomType = r.RoomType;



