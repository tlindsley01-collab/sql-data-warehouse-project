/* 
==============================================================================
Stored Procedure:  Load Bronze Layer (Source -> Bronze)
==============================================================================
Script Purpose:  
  This stored procedure loads data into the 'bronze' schema from external CSV files.
  It performs the following actions:
  - Truncates the bronze tables before loading data
  - Uses the 'BULK INSERT' command to load data from csv files to bronze tables

NOTE:  It is heavily commented because.....I'm a noob and I'm learning

Parameters:
  None.
  This stored procedure does not accapt any parameters or return any values

Usage Example:
  EXEC bronze.load_bronze;
==============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS --This is the creation / alteration of this stored procedure
BEGIN --Everything below is the begining of the procedure to be stored
	DECLARE @start_time DATETIME, @end_time DATETIME,@batch_start_time DATETIME, @batch_end_time DATETIME; -- Variables declared here to enable output of load duration in the 
	--output message
	BEGIN TRY --SQL WILL attempt to run the following procedure in the TRY block.  If it fails
		--then the CATCH script will run to handle the error(s)
		SET @batch_start_time = GETDATE();
		PRINT '===================================================================='; --MESSAGE AT THE START OF THE LOAD
		PRINT 'Loading Bronze Layer';
		PRINT '====================================================================';
		--CRM DATA---
		--Script to load the cust_info data file into the bronze.crm_cust_info’ table
		PRINT '--------------------------------------------------------------------'; --MESSAGE AT THE START OF THE LOAD
		PRINT 'Loading CRM Tables';
		PRINT '--------------------------------------------------------------------';
		
		SET @start_time = GETDATE();
		PRINT '>>Truncating Table bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info; --Empties existing data in the table, then loads with refreshed data from scratch.  This is a full load.
		
		PRINT '>>Inserting Data Into: bronze.crm_cust_info'; 
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\tom.lindsley\OneDrive - The Hackett Group, Inc\Desktop\Data Knowledge Development\SQL Bootcamp Files\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2, --Tells SQL Server that the data starts on row 2 in the file
			FIELDTERMINATOR = ',', -- Tells SQL Server that commas are used as the separator between data for each column
			TABLOCK --Option to lock the table to improve performance while data is being loaded
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>----------------------------------------------------------------------------------------------';

		-- QUERY TO CHECK THE QUALITY OF THE DATA LOAD AND ENSURE DATA WENT TO THE CORRECT COLUMNS
		-- SELECT * FROM bronze.crm_cust_info -- QUERY TO CHECK THE QUALITY OF THE DATA LOAD AND ENSURE DATA WENT TO THE CORRECT COLUMNS
		-- SELECT COUNT(*) FROM bronze.crm_cust_info ---- QUERY TO CHECK THAT THE TABLE ROW COUNT MATCHES THE CSV FILE

		--Script to load the cust_info data file into the 'bronze.crm_prd_info’ table
		PRINT '>>Truncating Table bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info; --Empties existing data in the table, then loads with refreshed data from scratch.  
		--This is a full load.
		
		SET @start_time = GETDATE();
		PRINT '>>Inserting Data Into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\tom.lindsley\OneDrive - The Hackett Group, Inc\Desktop\Data Knowledge Development\SQL Bootcamp Files\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2, --Tells SQL Server that the data starts on row 2 in the file
			FIELDTERMINATOR = ',', -- Tells SQL Server that commas are used as the separator between data for each column
			TABLOCK --Option to lock the table to improve performance while data is being loaded
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>----------------------------------------------------------------------------------------------';
		-- QUERY TO CHECK THE QUALITY OF THE DATA LOAD AND ENSURE DATA WENT TO THE CORRECT COLUMNS
		-- SELECT * FROM bronze.crm_prd_info -- QUERY TO CHECK THE QUALITY OF THE DATA LOAD AND ENSURE DATA WENT TO THE CORRECT COLUMNS
		-- SELECT COUNT(*) FROM bronze.crm_prd_info ---- QUERY TO CHECK THAT THE TABLE ROW COUNT MATCHES THE CSV FILE

		--Script to load the cust_info data file into the 'bronze.crm_sales_details’ table
		SET @start_time = GETDATE();
		PRINT '>>Truncating Table bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details; --Empties existing data in the table, then loads with refreshed data from scratch.  
		--This is a full load.
		PRINT '>>Inserting Data Into: crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\tom.lindsley\OneDrive - The Hackett Group, Inc\Desktop\Data Knowledge Development\SQL Bootcamp Files\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2, --Tells SQL Server that the data starts on row 2 in the file
			FIELDTERMINATOR = ',', -- Tells SQL Server that commas are used as the separator between data for each column
			TABLOCK --Option to lock the table to improve performance while data is being loaded
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>----------------------------------------------------------------------------------------------';
		-- QUERY TO CHECK THE QUALITY OF THE DATA LOAD AND ENSURE DATA WENT TO THE CORRECT COLUMNS
		-- SELECT * FROM bronze.crm_sales_details -- QUERY TO CHECK THE QUALITY OF THE DATA LOAD AND ENSURE DATA WENT TO THE CORRECT COLUMNS
		-- SELECT COUNT(*) FROM bronze.crm_sales_details ---- QUERY TO CHECK THAT THE TABLE ROW COUNT MATCHES THE CSV FILE

		--ERP DATA---
		--Script to load the cust_info data file into the bronze.erp_cust_az12’ table
		PRINT '--------------------------------------------------------------------'; --MESSAGE AT THE START OF THE LOAD
		PRINT 'Loading ERP Tables';
		PRINT '--------------------------------------------------------------------';
		
		SET @start_time = GETDATE();
		PRINT '>>Truncating Table bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12; --Empties existing data in the table, then loads with refreshed data from scratch.  
		--This is a full load.
		PRINT '>>Inserting Data Into: erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\tom.lindsley\OneDrive - The Hackett Group, Inc\Desktop\Data Knowledge Development\SQL Bootcamp Files\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2, --Tells SQL Server that the data starts on row 2 in the file
			FIELDTERMINATOR = ',', -- Tells SQL Server that commas are used as the separator between data for each column
			TABLOCK --Option to lock the table to improve performance while data is being loaded
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>----------------------------------------------------------------------------------------------';
		-- QUERY TO CHECK THE QUALITY OF THE DATA LOAD AND ENSURE DATA WENT TO THE CORRECT COLUMNS
		-- SELECT * FROM bronze.erp_cust_az12 -- QUERY TO CHECK THE QUALITY OF THE DATA LOAD AND ENSURE DATA WENT TO THE CORRECT COLUMNS
		-- SELECT COUNT(*) FROM bronze.erp_cust_az12 ---- QUERY TO CHECK THAT THE TABLE ROW COUNT MATCHES THE CSV FILE

		--Script to load the cust_info data file into the bronze.erp_loc_a101’ table
		
		SET @start_time = GETDATE();		
		PRINT '>>Truncating Table bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101; --Empties existing data in the table, then loads with refreshed data from scratch.  
		--This is a full load.
		PRINT '>>Inserting Data Into: erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\tom.lindsley\OneDrive - The Hackett Group, Inc\Desktop\Data Knowledge Development\SQL Bootcamp Files\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2, --Tells SQL Server that the data starts on row 2 in the file
			FIELDTERMINATOR = ',', -- Tells SQL Server that commas are used as the separator between data for each column
			TABLOCK --Option to lock the table to improve performance while data is being loaded
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>----------------------------------------------------------------------------------------------';
		-- QUERY TO CHECK THE QUALITY OF THE DATA LOAD AND ENSURE DATA WENT TO THE CORRECT COLUMNS
		-- SELECT * FROM bronze.erp_loc_a101 -- QUERY TO CHECK THE QUALITY OF THE DATA LOAD AND ENSURE DATA WENT TO THE CORRECT COLUMNS
		-- SELECT COUNT(*) FROM bronze.erp_loc_a101 ---- QUERY TO CHECK THAT THE TABLE ROW COUNT MATCHES THE CSV FILE

		--Script to load the cust_info data file into the bronze.erp_px_cat_g1v2’ table
		SET @start_time = GETDATE();
		PRINT '>>Truncating Table bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2; --Empties existing data in the table, then loads with refreshed data from scratch.  
		--This is a full load.
		PRINT '>>Inserting Data Into: erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\tom.lindsley\OneDrive - The Hackett Group, Inc\Desktop\Data Knowledge Development\SQL Bootcamp Files\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2, --Tells SQL Server that the data starts on row 2 in the file
			FIELDTERMINATOR = ',', -- Tells SQL Server that commas are used as the separator between data for each column
			TABLOCK --Option to lock the table to improve performance while data is being loaded
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>----------------------------------------------------------------------------------------------';
		
		SET @batch_end_time = GETDATE();
		PRINT '================================================================================================';
		PRINT 'Loading Bronze Layer is Completed';
		PRINT '>> LAYER LOAD DURATION: ' + CAST(DATEDIFF(second,@batch_start_time,@batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '================================================================================================';
	END TRY
	BEGIN CATCH
		PRINT '====================================================='
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'ERROR MESSAGE: ' + ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE: ' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR MESSAGE: ' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '====================================================='
	END CATCH
	-- QUERY TO CHECK THE QUALITY OF THE DATA LOAD AND ENSURE DATA WENT TO THE CORRECT COLUMNS
	-- SELECT * FROM bronze.erp_px_cat_g1v2 -- QUERY TO CHECK THE QUALITY OF THE DATA LOAD AND ENSURE DATA WENT TO THE CORRECT COLUMNS

	-- SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2 ---- QUERY TO CHECK THAT THE TABLE ROW COUNT MATCHES THE CSV FILE
END --This is the end of the stored procedure
