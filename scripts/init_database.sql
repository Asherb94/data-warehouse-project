/*
	SCRIPT PURPOSE: This scripts creates a new db called DataWareHouseProject after checking if its existing already. 

	WARNING: If this script is run it will drop the whole DataWareHouseProject db if it exists
	all the data will be deleted. 
*/


USE master;
GO

-- Drop and recreate db
IF EXISTS (Select 1 FROM sys.databases WHERE name = 'DataWareHouseProject')
BEGIN
	ALTER DATABASE DataWareHouseProject SET Single_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE DataWareHouseProject;
END;
GO

-- create db
CREATE DataBase DataWarehouseProject;
GO

USE DataWarehouseProject;
GO

-- create schemas
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO
