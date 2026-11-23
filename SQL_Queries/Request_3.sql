SELECT * FROM atliq_data.dim_product;
SELECT segment ,count( distinct product_code ) AS product_count
From atliq_data.dim_product
group by segment order by product_count desc
