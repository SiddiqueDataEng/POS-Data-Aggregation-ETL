/*
 * POS Data Aggregation ETL
 * Project #71 - Complete Database Implementation
 * SQL Server 2008/2012
 * Technology: SSIS, Bulk Insert
 * Created: 2013
 */

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'POS_ETL')
BEGIN
    ALTER DATABASE POS_ETL SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE POS_ETL;
END
GO

CREATE DATABASE POS_ETL
ON PRIMARY
(
    NAME = 'POS_ETL_Data',
    FILENAME = 'C:\SQLData\POS_ETL_Data.mdf',
    SIZE = 100MB,
    MAXSIZE = 5GB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = 'POS_ETL_Log',
    FILENAME = 'C:\SQLData\POS_ETL_Log.ldf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB
);
GO

ALTER DATABASE POS_ETL SET RECOVERY SIMPLE;
ALTER DATABASE POS_ETL SET AUTO_UPDATE_STATISTICS ON;
GO

USE POS_ETL;
GO

PRINT 'Database POS_ETL created successfully';
PRINT 'Project: POS Data Aggregation ETL';
PRINT 'Description: High-volume retail data processing';
GO
