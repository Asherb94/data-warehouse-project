/*

Script purpose:
	This script performs various quality checks for data consistency, accuracy, 
and standardization across the 'silver' schema. It may include checks for:
	1. Null or duplicate primary keys
	2. Unwanted or duplicate primary keys.
	3. Data standardization and consistency. 
	4. Invalid date ranges and orders.
	5. Data consistency between related fields.

*/


-- UNWATED SPACES CHECK
-- SHOULD NOT GET ANY RESULTS
SELECT cst_firstname
FROM silver.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

-- UNWATED SPACES CHECK
-- SHOULD NOT GET ANY RESULTS
SELECT cst_lastname
FROM silver.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

-- UNWATED SPACES CHECK
-- SHOULD NOT GET ANY RESULTS
SELECT cst_gndr
FROM silver.crm_cust_info
WHERE cst_gndr != TRIM(cst_gndr)

-- Check for Nulls or duplications in pk
-- SHOULD NOT GET ANY RESULTS
Select
  cst_id,
  COUNT(*)
FROM silver.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL;



-- UNWATED SPACES CHECK
-- SHOULD NOT GET ANY RESULTS
SELECT cst_firstname
FROM bronze.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

-- UNWATED SPACES CHECK
-- SHOULD NOT GET ANY RESULTS
SELECT cst_lastname
FROM bronze.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)

-- UNWATED SPACES CHECK
-- SHOULD NOT GET ANY RESULTS
SELECT cst_gndr
FROM bronze.crm_cust_info
WHERE cst_gndr != TRIM(cst_gndr)

-- checking for invalid date orders
select *
from silver.crm_prd_info
where prd_end_dt < prd_start_dt
