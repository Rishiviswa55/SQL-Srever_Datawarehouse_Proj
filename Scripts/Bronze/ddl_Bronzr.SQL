USE master;
GO

-- Force close all connections to DataWarehouse
ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

-- Now drop it safely
DROP DATABASE DataWarehouse; ---creating database
GO

-- Recreate database
CREATE DATABASE DataWarehouse;
GO

-- Switch to new database
USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA Bronze; ---medallian architecture 
GO
CREATE SCHEMA Silver;
GO
CREATE SCHEMA Gold;
GO

-- Table 1
If OBJECT_ID('Bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE Bronze.crm_cust_info;
CREATE TABLE Bronze.crm_cust_info (
    cst_id              INT,
    cst_key             NVARCHAR(50),
    cst_firstname       NVARCHAR(50),
    cst_lastname        NVARCHAR(50),
    cst_material_status NVARCHAR(50),
    cst_gndr            NVARCHAR(50),
    cst_create_date     DATE
);
GO

-- Table 2
If OBJECT_ID('Bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE Bronze.crm_prd_info;
CREATE TABLE Bronze.crm_prd_info (
    prd_id       INT,
    prd_key      NVARCHAR(50),
    prd_nm       NVARCHAR(50),
    prd_cost     INT,
    prd_line     NVARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt   DATETIME
);
GO

-- Table 3
If OBJECT_ID('Bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE Bronze.crm_sales_details;
CREATE TABLE Bronze.crm_sales_details (
    sis_ord_num  NVARCHAR(50),
    sis_prd_key  NVARCHAR(50),
    sis_cust_id  INT,
    sis_order_dt INT,
    sis_ship_dt  INT,
    sis_due_dt   INT,
    sis_sales    INT,
    sis_quantity INT,
    sis_price    INT
);
GO

-- Table 4
If OBJECT_ID('Bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE Bronze.erp_loc_a101;
CREATE TABLE Bronze.erp_loc_a101 (
    cid   NVARCHAR(50),
    cntry NVARCHAR(50)
);
GO

-- Table 5
If OBJECT_ID('Bronze.erp_cust_az12', 'U') IS NOT NULL ---is none keep it else drop
    DROP TABLE Bronze.erp_cust_az12;
CREATE TABLE Bronze.erp_cust_az12 (
    cid   NVARCHAR(50),
    bdate DATE,
    gen   NVARCHAR(50)
);
GO

-- Table 6
If OBJECT_ID('Bronze.erp_px_cat_g1v2', 'U') IS NOT NULL --is to drop the table and create a table
    DROP TABLE Bronze.erp_px_cat_g1v2;
CREATE TABLE Bronze.erp_px_cat_g1v2 (
    id          NVARCHAR(50),
    cat         NVARCHAR(50),
    subcat      NVARCHAR(50),
    maintenance NVARCHAR(50)
);
GO
