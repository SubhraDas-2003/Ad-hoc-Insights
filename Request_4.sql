SELECT * FROM atliq_data.fact_manufacturing_cost;
WITH cte1 AS (
    SELECT 
        p.segment,
        COUNT(DISTINCT s.product_code) AS product_count_2020
    FROM fact_sales_monthly s
    JOIN dim_product p
        ON p.product_code = s.product_code
    WHERE s.fiscal_year = 2020
    GROUP BY p.segment
    ORDER BY product_count_2020 DESC
),

cte2 AS (
    SELECT 
        p.segment,
        COUNT(DISTINCT s.product_code) AS product_count_2021
    FROM fact_sales_monthly s
    JOIN dim_product p
        ON p.product_code = s.product_code
    WHERE s.fiscal_year = 2021
    GROUP BY p.segment
    ORDER BY product_count_2021 DESC
)

SELECT 
    cte1.segment,
    product_count_2020,
    product_count_2021,
    ABS(product_count_2021 - product_count_2020) AS difference
FROM cte1
JOIN cte2
    ON cte1.segment = cte2.segment
ORDER BY difference DESC;