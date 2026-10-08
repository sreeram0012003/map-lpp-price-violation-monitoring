CREATE DATABASE data_analysis;
USE data_analysis;
SELECT DATABASE();
show tables;

select * from pl_table limit 5;
select * from sku_table limit 5;
select * from seller_mapping_table limit 5;
select * from price_list_table limit 5;
select * from category_mapping_table limit 5;

SELECT 'pl_table' AS table_name, COUNT(*) AS rows_count
FROM pl_table

UNION ALL

SELECT 'sku_table', COUNT(*)
FROM sku_table

UNION ALL

SELECT 'seller_mapping_table', COUNT(*)
FROM seller_mapping_table

UNION ALL

SELECT 'price_list_table', COUNT(*)
FROM price_list_table

UNION ALL

SELECT 'category_mapping_table', COUNT(*)
FROM category_mapping_table;

DESCRIBE pl_table;
DESCRIBE sku_table;
DESCRIBE seller_mapping_table;
DESCRIBE price_list_table;
DESCRIBE category_mapping_table;
USE data_analysis;
DESCRIBE promotion_table;
SELECT COUNT(*) AS total_rows
FROM promotion_table;
SELECT *
FROM promotion_table
LIMIT 10;
SELECT SKU, COUNT(*) AS count
FROM promotion_table
GROUP BY SKU
HAVING COUNT(*) > 1;
SELECT Season, COUNT(*) AS total_rows
FROM promotion_table
GROUP BY Season;

select * from pl_table;

USE data_analysis;

CREATE TABLE price_monitoring_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(500),
    product_url TEXT,
    selling_price DECIMAL(12,2),
    platform VARCHAR(50),
    scraped_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

DESCRIBE price_monitoring_table;

SELECT COUNT(*) AS total_products
FROM price_monitoring_table;

use data_analysis;

select count(*) as total_rows
from seller_mapping_table;

select * from sku_table;
select * from pl_table;
select * from seller_mapping_table;
select * from price_list_table;
select * from category_mapping_table;
select * from promotion_table;

SELECT COUNT(*) AS rows_to_remove
FROM pl_table
WHERE lpp_sub_category IN ('SJ', 'UNK')
   OR lpp IS NULL;
   

SET SQL_SAFE_UPDATES = 0;

DELETE FROM pl_table
WHERE lpp_sub_category IN ('SJ', 'UNK')
   OR lpp IS NULL;
   
SELECT COUNT(*) AS remaining_bad_rows
FROM pl_table
WHERE lpp_sub_category IN ('SJ', 'UNK')
   OR lpp IS NULL;
   
SELECT COUNT(*) AS rows_to_remove
FROM category_mapping_table
WHERE category IN ('SJ', 'UNK')
   OR sub_category IN ('SJ', 'UNK')
   OR category IS NULL
   OR sub_category IS NULL;
   
SET SQL_SAFE_UPDATES = 0;

DELETE FROM category_mapping_table
WHERE category IN ('SJ', 'UNK')
   OR sub_category IN ('SJ', 'UNK')
   OR category IS NULL
   OR sub_category IS NULL;
   
SELECT COUNT(*) AS remaining_bad_rows
FROM category_mapping_table
WHERE category IN ('SJ', 'UNK')
   OR sub_category IN ('SJ', 'UNK')
   OR category IS NULL
   OR sub_category IS NULL;

SET SQL_SAFE_UPDATES = 1;

select * from pl_table;
select * from promotion_table;
use data_analysis;
SELECT * FROM violation_table;

USE data_analysis;

SELECT Violation_count, Action, COUNT(*) AS total
FROM violation_table
GROUP BY Violation_count, Action
ORDER BY Violation_count;

SELECT * FROM seller_mapping_table LIMIT 10;

USE data_analysis;

ALTER TABLE seller_mapping_table
ADD COLUMN Seller_Email VARCHAR(255);

SELECT * FROM seller_mapping_table LIMIT 10;

USE data_analysis;

SELECT COUNT(*) AS Total_Violations
FROM violation_table;

SELECT Action, COUNT(*) AS Total
FROM violation_table
GROUP BY Action;

SELECT Marketplace, COUNT(*) AS Total
FROM violation_table
GROUP BY Marketplace;

SELECT Category, COUNT(*) AS Total
FROM violation_table
GROUP BY Category;

SELECT Seller_name, COUNT(*) AS Total
FROM violation_table
GROUP BY Seller_name
ORDER BY Total DESC
LIMIT 10;