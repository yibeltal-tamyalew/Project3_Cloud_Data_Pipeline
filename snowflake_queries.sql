-- Create database
CREATE OR REPLACE DATABASE SUPERMARKET_DB2;

-- Use the database
USE DATABASE SUPERMARKET_DB2;

-- Create cleaned table
CREATE OR REPLACE TABLE SUPERMARKET_SALES_CLEAN (
    InvoiceID VARCHAR,
    Branch VARCHAR,
    City VARCHAR,
    CustomerType VARCHAR,
    Gender VARCHAR,
    ProductLine VARCHAR,
    UnitPrice NUMBER,
    Quantity NUMBER,
    Tax5 NUMBER,
    Sales NUMBER,
    Date DATE,
    Time TIME,
    Payment VARCHAR,
    Cogs NUMBER,
    GrossMarginPercentage NUMBER,
    GrossIncome NUMBER,
    Rating NUMBER,
    Year NUMBER,
    Month VARCHAR,
    Day NUMBER
);

-- Load data (done via Snowflake Web UI)
-- COPY INTO SUPERMARKET_SALES_CLEAN FROM @MY_STAGE/... (if staging was used)

-- Example analysis queries

-- 1. Total sales per branch
SELECT Branch, SUM(Sales) AS Total_Sales
FROM SUPERMARKET_SALES_CLEAN
GROUP BY Branch
ORDER BY Total_Sales DESC;

-- 2. Sales by product line
SELECT ProductLine, SUM(Sales) AS Total_Sales
FROM SUPERMARKET_SALES_CLEAN
GROUP BY ProductLine
ORDER BY Total_Sales DESC;

-- 3. Payment method distribution
SELECT Payment, COUNT(*) AS Transactions
FROM SUPERMARKET_SALES_CLEAN
GROUP BY Payment;

-- 4. Monthly sales trend
SELECT Month, SUM(Sales) AS Total_Sales
FROM SUPERMARKET_SALES_CLEAN
GROUP BY Month
ORDER BY Total_Sales;
