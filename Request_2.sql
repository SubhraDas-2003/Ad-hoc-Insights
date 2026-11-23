SELECT * FROM atliq_data.fact_manufacturing_cost;

WITH CTE1 AS
(SELECT COUNT(distinct product_code ) AS unique_products_2020 
FROM atliq_data.fact_manufacturing_cost
WHERE cost_year = 2020),
CTE2 AS
(SELECT COUNT(distinct product_code ) AS unique_products_2021
FROM atliq_data.fact_manufacturing_cost
WHERE cost_year = 2021)
SELECT CTE1.*,CTE2.*,
ROUND( (unique_products_2021- unique_products_2020)*100/unique_products_2020,2) AS percentage_chg 
FROM CTE1 CROSS JOIN CTE2
