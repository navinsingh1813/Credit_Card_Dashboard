
--Creating Database named Credit_Card
Create database Credit_Card

--Using the Database 
use Credit_Card

--Creating Credit_card table 
Create table cc_details (
	Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

Select * from cc_details


--Creating Custumer table 
Create table cust_details (
	Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);

select * from cust_details


--Copy csv data into SQL (remember to update the file name and file location in below query)
--This Query is only for SQL Server Management Studio

--Insert data from CSV file to Credit Card Details table
Bulk insert cc_details
FROM 'D:\projects\Credit Card Financial Dashboard\Raw Data\credit_card.csv' ---- Full file path
with (
	FORMAT = 'CSV'			--Format of the file
	 ,FIELDTERMINATOR = ','   -- Fields are separated by commas
     ,ROWTERMINATOR = '\n'    -- Rows are separated by newlines
    ,FIRSTROW = 2             -- Start from the second row if headers are present
);

--View the table
Select * from cc_details

-- If you are getting below error :
-- Check the Data in Your CSV File: Ensure date column values are formatted correctly and are in a valid format that SQL Server can recognize (e.g., YYYY-MM-DD). And correct any incorrect or missing date values in the CSV file.

--Insert data from CSV file to Customer Details table
Bulk insert cust_details
FROM 'D:\projects\Credit Card Financial Dashboard\Raw Data\customer.csv' ---- Full file path
with (
	FORMAT = 'CSV'			--Format of the file
	 ,FIELDTERMINATOR = ','   -- Fields are separated by commas
     ,ROWTERMINATOR = '\n'    -- Rows are separated by newlines
    ,FIRSTROW = 2             -- Start from the second row if headers are present
);

--View the file
select * from cust_details

--Insert additional data (cc_add) into SQL, using same BULK INSERT function.
Bulk insert cc_details
FROM 'D:\projects\Credit Card Financial Dashboard\Raw Data\cc_add.csv' ---- Full file path
with (
	FORMAT = 'CSV'			--Format of the file
	 ,FIELDTERMINATOR = ','   -- Fields are separated by commas
     ,ROWTERMINATOR = '\n'    -- Rows are separated by newlines
    ,FIRSTROW = 2             -- Start from the second row if headers are present
);

--View the file 
select * from cc_details

--Insert additional data (cust_add) into SQL, using same BULK INSERT function.
Bulk insert cust_details
FROM 'D:\projects\Credit Card Financial Dashboard\Raw Data\cust_add.csv' ---- Full file path
with (
	FORMAT = 'CSV'			--Format of the file
	 ,FIELDTERMINATOR = ','   -- Fields are separated by commas
     ,ROWTERMINATOR = '\n'    -- Rows are separated by newlines
    ,FIRSTROW = 2             -- Start from the second row if headers are present
);

--View the file
select * from cust_details
