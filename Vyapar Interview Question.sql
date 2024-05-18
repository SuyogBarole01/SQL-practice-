CREATE DATABASE practice;
USE practice;

CREATE TABLE Payment (
    Id INT PRIMARY KEY,
    Payment_Date DATE,
    Amount DECIMAL(10, 2),
    Currency VARCHAR(10),
    Currency_Exchange DECIMAL(10, 2),
    Status VARCHAR(20)
);
INSERT INTO Payment (Id, Payment_Date, Amount, Currency, Currency_Exchange, Status)
VALUES
(1, '2024-01-15', 100.00, 'Rupee', 1.00, 'Successful'),
(2, '2024-01-20', 50.00, 'Dollar', 80.00, 'Successful'),
(3, '2024-02-10', 75.00, 'Rupee', 1.00, 'Successful'),
(4, '2024-02-25', 200.00, 'Dollar', 80.00, 'Successful'),
(5, '2024-03-05', 120.00, 'Rupee', 1.00, 'Successful'),
(6, '2024-03-15', 80.00, 'Dollar', 80.00, 'Successful'),
(7, '2024-04-10', 150.00, 'Rupee', 1.00, 'Refund'),
(8, '2024-04-20', 90.00, 'Dollar', 80.00, 'Refund'),
(9, '2024-05-05', 180.00, 'Rupee', 1.00, 'Partial Refund'),
(10, '2024-05-15', 60.00, 'Dollar', 80.00, 'Partial Refund'),
(11, '2024-06-01', 300.00, 'Rupee', 1.00, 'Failed'),
(12, '2024-06-10', 40.00, 'Dollar', 80.00, 'Failed'),
(13, '2024-01-01', 100.00, 'Rupee', 1.00, 'Successful'),
(14, '2024-01-02', 150.00, 'Dollar', 80.00, 'Refund'),
(15, '2024-01-03', 200.00, 'Rupee', 1.00, 'Partial Refund'),
(16, '2024-01-04', 250.00, 'Dollar', 80.00, 'Failed'),
(17, '2024-01-05', 300.00, 'Rupee', 1.00, 'Successful'),
(18, '2024-01-06', 350.00, 'Dollar', 80.00, 'Refund'),
(19, '2024-01-07', 400.00, 'Rupee', 1.00, 'Partial Refund'),
(20, '2024-01-08', 450.00, 'Dollar', 80.00, 'Failed'),
(21, '2024-01-09', 500.00, 'Rupee', 1.00, 'Successful'),
(22, '2024-01-10', 550.00, 'Dollar', 80.00, 'Refund'),
(23, '2024-01-11', 600.00, 'Rupee', 1.00, 'Partial Refund'),
(24, '2024-01-12', 650.00, 'Dollar', 80.00, 'Failed'),
(25, '2024-01-13', 700.00, 'Rupee', 1.00, 'Successful'),
(26, '2024-01-14', 750.00, 'Dollar', 80.00, 'Refund'),
(27, '2024-01-15', 800.00, 'Rupee', 1.00, 'Partial Refund'),
(28, '2024-01-16', 850.00, 'Dollar', 80.00, 'Failed'),
(29, '2024-01-17', 900.00, 'Rupee', 1.00, 'Successful'),
(30, '2024-01-18', 950.00, 'Dollar', 80.00, 'Refund'),
(31, '2024-01-19', 1000.00, 'Rupee', 1.00, 'Partial Refund'),
(32, '2024-01-20', 1050.00, 'Dollar', 80.00, 'Failed'),
(33, '2024-01-21', 1100.00, 'Rupee', 1.00, 'Successful'),
(34, '2024-01-22', 1150.00, 'Dollar', 80.00, 'Refund'),
(35, '2024-01-23', 1200.00, 'Rupee', 1.00, 'Partial Refund'),
(36, '2024-01-24', 1250.00, 'Dollar', 80.00, 'Failed'),
(37, '2024-01-25', 1300.00, 'Rupee', 1.00, 'Successful'),
(38, '2024-01-26', 1350.00, 'Dollar', 80.00, 'Refund'),
(39, '2024-01-27', 1400.00, 'Rupee', 1.00, 'Partial Refund'),
(40, '2024-01-28', 1450.00, 'Dollar', 80.00, 'Failed'),
(41, '2024-01-29', 1500.00, 'Rupee', 1.00, 'Successful'),
(42, '2024-01-30', 1550.00, 'Dollar', 80.00, 'Refund'),
(43, '2024-01-31', 1600.00, 'Rupee', 1.00, 'Partial Refund'),
(44, '2024-02-01', 1650.00, 'Dollar', 80.00, 'Failed'),
(45, '2024-02-02', 1700.00, 'Rupee', 1.00, 'Successful'),
(46, '2024-02-03', 1750.00, 'Dollar', 80.00, 'Refund'),
(47, '2024-02-04', 1800.00, 'Rupee', 1.00, 'Partial Refund'),
(48, '2024-02-05', 1850.00, 'Dollar', 80.00, 'Failed'),
(49, '2024-02-06', 1900.00, 'Rupee', 1.00, 'Successful'),
(50, '2024-02-07', 1950.00, 'Dollar', 80.00, 'Refund'),
(51, '2024-02-08', 2000.00, 'Rupee', 1.00, 'Partial Refund'),
(52, '2024-02-09', 2050.00, 'Dollar', 80.00, 'Failed');

SELECT 
    EXTRACT(YEAR FROM Payment_Date) AS Year,
    EXTRACT(MONTH FROM Payment_Date) AS Month,
    SUM(Amount * Currency_Exchange) AS Revenue
FROM 
    Payment
WHERE 
    Status = 'Successful'
GROUP BY 
    EXTRACT(YEAR FROM Payment_Date),
    EXTRACT(MONTH FROM Payment_Date)
ORDER BY 
    Year, Month;
  
 WITH MonthlyRevenue AS (
    SELECT 
        EXTRACT(YEAR FROM Payment_Date) AS Year,
        EXTRACT(MONTH FROM Payment_Date) AS Month,
        SUM(Amount * Currency_Exchange) AS Revenue
    FROM 
        Payment
    WHERE 
        Status = 'Successful'
    GROUP BY 
        EXTRACT(YEAR FROM Payment_Date),
        EXTRACT(MONTH FROM Payment_Date)
),
RevenueChange AS (
    SELECT
        Year,
        Month,
        Revenue,
        LAG(Revenue) OVER (ORDER BY Year, Month) AS LastMonthRevenue,
        (Revenue - LAG(Revenue) OVER (ORDER BY Year, Month)) / LAG(Revenue) OVER (ORDER BY Year, Month) AS RevenueChange
    FROM
        MonthlyRevenue
)
SELECT
    Year,
    Month,
    Revenue,
    COALESCE(RevenueChange * 100, 0) AS PercentageChange
FROM
    RevenueChange
ORDER BY
    Year, Month;
 






   