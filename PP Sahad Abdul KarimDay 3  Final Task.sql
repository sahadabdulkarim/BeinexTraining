use product;

select * from customermaster;

select * from salesorder;

show create table customermaster;

show create table salesorder;

INSERT INTO salesorder (Sales_ID, OrderDate, Customer_ID, Item, Units, `Unit Cost`, Total)
VALUES (11, '2021-06-26', 'C3', 'Pencil', 22, 1.99, 43.78);
INSERT INTO salesorder (Sales_ID, OrderDate, Customer_ID, Item, Units, `Unit Cost`, Total)
VALUES (34, '2022-12-04', 'C3', 'Binder', 94, 19.99, 1879.06);
INSERT INTO salesorder (Sales_ID, OrderDate, Customer_ID, Item, Units, `Unit Cost`, Total)
VALUES (19, '2021-12-29', 'C10', 'Pen Set', 74, 15.99, 1183.26);
INSERT INTO salesorder (Sales_ID, OrderDate, Customer_ID, Item, Units, `Unit Cost`, Total)
VALUES (31, '2022-10-14', 'C7', 'Binder', 57, 19.99, 1139.43);
INSERT INTO salesorder (Sales_ID, OrderDate, Customer_ID, Item, Units, `Unit Cost`, Total)
VALUES (21, '2022-02-01', 'C11', 'Binder', 87, 15, 1305.00);

-- joining 

SELECT so.Sales_ID, so.OrderDate, so.Customer_ID, cm.Customer, cm.Region, so.Item, so.Units, so.`Unit Cost`, so.Total
FROM salesorder so
JOIN customermaster cm ON so.Customer_ID = cm.Customer_ID
ORDER BY so.Sales_ID ASC;


-- 1) Set suitable SQL contraints to column while creating tables. 

ALTER TABLE customermaster MODIFY COLUMN Customer_ID VARCHAR(10);
ALTER TABLE salesorder MODIFY COLUMN Customer_ID VARCHAR(10);
ALTER TABLE customermaster ADD PRIMARY KEY (Customer_ID);
ALTER TABLE salesorder ADD CONSTRAINT fk_customer FOREIGN KEY (Customer_ID) REFERENCES customermaster(Customer_ID);


-- 2) Write a command to display first 10 rows.
SELECT so.*, cm.Customer,cm.Region
FROM salesorder AS so LEFT JOIN customermaster AS cm ON so.Customer_ID = cm.Customer_ID
LIMIT 10;


-- 3) Identify unique items?

SELECT DISTINCT Item
FROM salesorder;

-- 4) Identify any unit cost is negative?

SELECT * FROM salesorder WHERE `Unit Cost` < 0;

-- 5) Identify minimum and maximum unit price happened for same item. 

SELECT Item, MIN(`Unit Cost`) AS MinimumPrice, MAX(`Unit Cost`) AS MaximumPrice
FROM salesorder
GROUP BY Item;

-- 6) Identify the Total sales happened in the year of 2021?

SELECT SUM(Total) AS TotalSales
FROM salesorder
WHERE YEAR(OrderDate) = 2021;

-- 7) Which item is sold maximum in the year 2021?

SELECT Item, SUM(Units) AS TotalUnitsSold
FROM salesorder
WHERE YEAR(OrderDate) = 2021
GROUP BY Item
ORDER BY TotalUnitsSold DESC
LIMIT 1;

--  8) Identify the region with highest and lowest sales.

SELECT Region, SUM(Total) AS TotalSales
FROM salesorder so
JOIN customermaster cm ON so.Customer_ID = cm.Customer_ID
GROUP BY Region
ORDER BY TotalSales DESC
LIMIT 1;

SELECT Region, SUM(Total) AS TotalSales
FROM salesorder so
JOIN customermaster cm ON so.Customer_ID = cm.Customer_ID
GROUP BY Region
ORDER BY TotalSales ASC
LIMIT 1;

-- 9) Identify the customer name having highest sales for the year 2022.

SELECT cm.Customer 
FROM salesorder so, customermaster cm
WHERE YEAR(so.OrderDate) = 2022
GROUP BY cm.Customer
ORDER BY SUM(so.Total) DESC
LIMIT 1;

-- 10) Which item has highest and lowest unit cost?

SELECT Item, `Unit Cost`
FROM salesorder
ORDER BY `Unit Cost` DESC
LIMIT 1;


SELECT Item, `Unit Cost`
FROM salesorder
ORDER BY `Unit Cost` ASC
LIMIT 1;

--  11) Identify items starts with letter 'P'.

SELECT Item
FROM salesorder
WHERE Item LIKE 'P%';

-- 12) Filter the table having items Pen and Pencil.

SELECT * 
FROM salesorder
WHERE Item IN ('Pen','Pencil');

-- 13) Filter the table with unit cost between 1 and 100.

SELECT *
FROM salesorder
WHERE `Unit Cost` BETWEEN 1 AND 100;

-- 14) Identify the customer with more no of transaction(no of entries).

SELECT Customer_ID, COUNT(*) AS TransactionCount
FROM salesorder
GROUP BY Customer_ID
ORDER BY TransactionCount DESC
LIMIT 1;

-- 15) Identify which item has maximum sales in each region.

SELECT cm.Region, so.Item, SUM(so.Units) AS TotalUnitsSold
FROM salesorder AS so
JOIN customermaster AS cm ON so.Customer_ID = cm.Customer_ID
GROUP BY cm.Region, so.Item
HAVING SUM(so.Units) = (
    SELECT MAX(sales_total)
    FROM (
        SELECT cm.Region, so.Item, SUM(so.Units) AS sales_total
        FROM salesorder AS so
        JOIN customermaster AS cm ON so.Customer_ID = cm.Customer_ID
        GROUP BY cm.Region, so.Item
    ) AS region_sales
    WHERE region_sales.Region = cm.Region
);

--  16) Create 5 more scenarios using important inbuilt functions of MySQL.

-- Calculate the average unit cost for each item.
SELECT Item, AVG(`Unit Cost`) AS AverageUnitCost
FROM salesorder
GROUP BY Item;

-- Find the total revenue for each customer.
SELECT Customer_ID, SUM(Total) AS TotalRevenue
FROM salesorder
GROUP BY Customer_ID;

--  Concatenate the customer name and region into a single column.
SELECT CONCAT(Customer, ' - ', Region) AS CustomerRegion
FROM customermaster;

--  Get the current date and time.
SELECT NOW() AS CurrentDateTime;


