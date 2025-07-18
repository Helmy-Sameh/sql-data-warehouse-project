/*
====================================================================
Stored Procedure: Load Bronze Layer (Source Bronze)
====================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the 'BULK INSERT' comand to load data from csv Files to bronze tables.

Parameters :
None.
This stored procedure does not accept any parameters or return any values.

Usage Example:
EXEC bronze. load bronze;
====================================================================
*/


CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
	SET @batch_start_time = GETDATE();
	BEGIN TRY
		PRINT'=============================================';
		PRINT'Loding Bronze Layer';
		PRINT'=============================================';

		PRINT'---------------------------------------------';
		PRINT'Loding CRM Tables';
		PRINT'---------------------------------------------';

		SET @start_time = GETDATE();	
		PRINT'>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT'>> Inserting Data into: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\Helmy Sameh\Documents\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @START_TIME, @END_TIME) AS NVARCHAR) + 'Seconds';
		PRINT '>> ---------------'


		PRINT'---------------------------------------------';
		PRINT'Loding CRM Tables';
		PRINT'---------------------------------------------';
		
		SET @start_time = GETDATE();
		PRINT'>> Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT'>> Inserting Data into: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\Helmy Sameh\Documents\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @START_TIME, @END_TIME) AS NVARCHAR) + 'Seconds';
		PRINT '>> ---------------'

		PRINT'---------------------------------------------';
		PRINT'Loding CRM Tables';
		PRINT'---------------------------------------------';


		SET @start_time = GETDATE();
		PRINT'>> Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT'>> Inserting Data into: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\Helmy Sameh\Documents\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @START_TIME, @END_TIME) AS NVARCHAR) + 'Seconds';
		PRINT '>> ---------------'

		PRINT'---------------------------------------------';
		PRINT'Loding ERP Tables';
		PRINT'---------------------------------------------';

		SET @start_time = GETDATE();
		PRINT'>> Truncating Table: bronze.erp_loc_a101';
		TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT'>> Inserting Data into: bronze.erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\Helmy Sameh\Documents\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @START_TIME, @END_TIME) AS NVARCHAR) + 'Seconds';
		PRINT '>> ---------------'

		PRINT'---------------------------------------------';
		PRINT'Loding ERP Tables';
		PRINT'---------------------------------------------';


		SET @start_time = GETDATE();
		PRINT'>> Truncating Table: bronze.erp_CUST_AZ12';
		TRUNCATE TABLE bronze.erp_CUST_AZ12;
		PRINT'>> Inserting Data into: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\Helmy Sameh\Documents\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @START_TIME, @END_TIME) AS NVARCHAR) + 'Seconds';
		PRINT '>> ---------------'


		PRINT'---------------------------------------------';
		PRINT'Loding ERP Tables';
		PRINT'---------------------------------------------';

		SET @start_time = GETDATE();
		PRINT'>> Truncating Table: bronze.erp_px_cat_g1v2';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;	
		PRINT'>> Inserting Data into: bronze.erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\Helmy Sameh\Documents\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(SECOND, @START_TIME, @END_TIME) AS NVARCHAR) + 'Seconds';
	PRINT '>> ---------------'
	
	SET @batch_end_time = GETDATE();
	PRINT'=============================================';
	PRINT'Loading Bronze Layer is Completed';
	PRINT'';
	PRINT'=============================================';
	END TRY
	BEGIN CATCH 
		PRINT'=============================================';
		PRINT'ERROR ACCURDED LOADING BRONZE LAYER';
		PRINT'ERROR Message' + ERROR_MESSAGE();
		PRINT'ERROR Message' + CAST(ERROR_NUMBER()AS NVARCHAR);
		PRINT'ERROR Message' + CAST(ERROR_STATE()AS NVARCHAR);
		PRINT'=============================================';

	END CATCH
END;
