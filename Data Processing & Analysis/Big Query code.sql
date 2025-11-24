--1. WHERE Clause
--Q1. Filter all transactions that occurred in the year 2023.
--Expected output: All columns

SELECT
    *
FROM
    `dotted-aileron-478118-e4.retail.dataset`
WHERE
    Date >= '2023-01-01' AND Date < '2024-01-01';

---------------------------------------------------------------------------------------------------------------------------
--2. Filtering + Conditions
--Q2. Display all transactions where the Total Amount is more than the average Total Amount of the entire dataset.
--Expected output: All columns

WITH clean AS (
        SELECT AVG(`Total Amount`) AS AVG_TOTAL_AMOUNT FROM `dotted-aileron-478118-e4.retail.dataset`
)
SELECT
    *
FROM
    `dotted-aileron-478118-e4.retail.dataset`
WHERE
    `Total Amount` > (SELECT AVG_TOTAL_AMOUNT FROM clean);

---------------------------------------------------------------------------------------------------------------------------
--3. Aggregate Functions
--Q3. Calculate the total revenue (sum of Total Amount).
--Expected output: Total_Revenue

SELECT SUM(`Total Amount`) AS Total_Revenue
FROM `dotted-aileron-478118-e4`.`retail`.`dataset`;

---------------------------------------------------------------------------------------------------------------------------
--4. DISTINCT
--Q4. Display all distinct Product Categories in the dataset.
--Expected output: Product_Category

SELECT DISTINCT `Product Category`
FROM `dotted-aileron-478118-e4`.`retail`.`dataset`;

---------------------------------------------------------------------------------------------------------------------------
--5. GROUP BY
--Q5. For each Product Category, calculate the total quantity sold.
--Expected output: Product_Category, Total_Quantity

SELECT `Product Category`, SUM(Quantity) AS Total_Quantity
FROM `dotted-aileron-478118-e4.retail.dataset`
GROUP BY `Product Category`;

---------------------------------------------------------------------------------------------------------------------------
--6. CASE Statement
--Q6. Create a column called Age_Group that classifies customers as ‘Youth’ (<30), ‘Adult’ (30–59), and ‘Senior’ (60+).
--Expected output: Customer_ID, Age, Age_Group

SELECT
  `Customer ID`,
   Age,
  CASE WHEN Age < 30 THEN 'Youth'
      WHEN Age BETWEEN 30 AND 59 THEN 'Adult'
      ELSE 'Senior' 
  END AS Age_Group
FROM `dotted-aileron-478118-e4.retail.dataset`;

---------------------------------------------------------------------------------------------------------------------------
--7. Conditional Aggregation
--Q7. For each Gender, count how many high-value transactions occurred (where Total Amount > 500).
--Expected output: Gender, High_Value_Transactions

SELECT Gender,
       COUNT(`Transaction ID`) AS High_Value_Transactions
FROM `dotted-aileron-478118-e4.retail.dataset`
WHERE `Total Amount` > 500
GROUP BY Gender;

---------------------------------------------------------------------------------------------------------------------------
--8. HAVING Clause
--Q8. For each Product Category, show only those categories where the total revenue exceeds 5,000.
--Expected output: Product_Category, Total_Revenue

SELECT `Product Category`,
        SUM(`Total Amount`) As Total_Revenue
FROM `dotted-aileron-478118-e4.retail.dataset`
GROUP BY `Product Category`
HAVING SUM(`Total Amount`) > 5000;

---------------------------------------------------------------------------------------------------------------------------
--Q9. Display a new column called Unit_Cost_Category that labels a transaction as: – 'Cheap' if Price per Unit < 50 – 'Moderate' if Price per Unit between 50 and 200 – 'Expensive' if Price per Unit > 200
--Expected output: Transaction_ID, Price_per_Unit, Unit_Cost_Category

SELECT `TRANSACTION ID`,
       `price per unit`,
   CASE WHEN `price per unit` < 50 THEN 'Cheap'
        WHEN `price per unit` BETWEEN 50 AND 200 THEN 'Moderate'
        ELSE 'Expensive'
   END AS Unit_Price_Category
FROM `dotted-aileron-478118-e4.retail.dataset`;

---------------------------------------------------------------------------------------------------------------------------
--10. Combining WHERE + CASE


SELECT `Customer ID`,
        Age,
        `Total Amount`,
     CASE WHEN `Total Amount` > 1000 THEN 'High'
          ELSE 'Low'
     END AS Spending_Level
FROM `dotted-aileron-478118-e4.retail.dataset`
WHERE Age >= 40;

---------------------------------------------------------------------------------------------------------------------------
