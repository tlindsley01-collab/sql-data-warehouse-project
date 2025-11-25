/*
====================================================================================
DDL Script:  Create Bronze Tables
====================================================================================
Script Purpose:
  This script creates tables in the 'bronze' schema, dropping existing tables if they
  already exist.
  Run this script to re-define the DDL structure of the 'bronze' tables
====================================================================================
*/
--CRM Bronze table creation--
--CREATE BRONZE TABLE FOR cust_info data  

/*
The following TSQL would be added to the ddl to check and see if the table exists first.  Then drop existing and add the new table
defined in the query.  This would be added to the beginning of each query*/

--IF OBJECT_ID ('bronze.crm_cust_info', 'U') IS NOT NULL
	--DROP TABLE bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info (
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
	);

--CREATE BRONZE TABLE FOR prd_info data 
CREATE TABLE bronze.crm_prd_info (
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME
	);

	--CREATE BRONZE TABLE FOR sales_details data 
CREATE TABLE bronze.crm_sales_details (
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
	);

--ERP Bronze table creation--
--CREATE BRONZE TABLE FOR cust_az12 
CREATE TABLE bronze.erp_cust_az12 (
	cid NVARCHAR(50),
	bdate DATE,
	gen NVARCHAR(50)
	);

	--CREATE BRONZE TABLE FOR loc_a101 --HAVE NOT EXECUTED YET
CREATE TABLE bronze.erp_loc_a101 (
	cid NVARCHAR(50),
	cntry NVARCHAR(50)
	);

	--CREATE BRONZE TABLE FOR px_cat_g1v2 --HAVE NOT EXECUTED YET
CREATE TABLE bronze.erp_px_cat_g1v2 (
	id NVARCHAR(50),
	cat NVARCHAR(50),
	subcat NVARCHAR(50),
	maintenance NVARCHAR(50)
	);
