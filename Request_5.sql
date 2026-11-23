SELECT 
    m.product_code,
    p.product,
    m.manufacturing_cost
FROM fact_manufacturing_cost m
JOIN dim_product p
    ON m.product_code = p.product_code
WHERE m.manufacturing_cost = (
    SELECT MAX(manufacturing_cost)
    FROM fact_manufacturing_cost
)
OR m.manufacturing_cost = (
    SELECT MIN(manufacturing_cost)
    FROM fact_manufacturing_cost
)
ORDER BY m.manufacturing_cost DESC;