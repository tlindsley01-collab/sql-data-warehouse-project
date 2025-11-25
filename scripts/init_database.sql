/*
====================================================================================
Create Database and Schemas
====================================================================================
Script Purpose:
  This script creates a new database named 'DataWarehouse' after checking if it already exists.
  If the database exists, it is dropped and recreated.  Additionally, the script sets up three schemas
  within the database:  'bronze', 'silver', and 'gold'.
  
--WARNING:
  --Running this script will drop the entire 'DataWarehouse' database if it exists.
  --All data in the database will be permanently deleted.  Proceed with caution
  --and ensure you have proper backups before running this script.
*/

USE MASTER; --Entered this to access the database master (system database) in SQL Server
GO

--ONLY USE THE FOLLOWING IF RECREATING THE DATABASE.  IF NOT....CONTINUE TO 'CREATE DATABASE SECTION BELOW.
  --This will drop and recreate the 'DataWarehouse' database
  IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
  BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO

--CREATE Database 'Data Warehouse'
	CREATE DATABASE DataWarehouse; --Once in the system database, I entered and ran this to create my new database

	USE DataWarehouse; --Once the database was created, I entered and ran this to begin using the database for build-out of the db

	--Creates the schemas for each layer of the medallion architecture.  They appear in 
	-- 'DataWarehouse' > 'Security' > 'Schemas'
	CREATE SCHEMA bronze; 
	GO --This is the separator command that tells SQL to complete each command separately, then move to the next
	CREATE SCHEMA silver;
	GO --This is the separator command that tells SQL to complete each command separately, then move to the next
	CREATE SCHEMA gold;
	GO --This is the separator command that tells SQL to complete each command separately, then move to the next
