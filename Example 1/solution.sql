CREATE table products (
PRODUCT_ID int NOT NULL PRIMARY KEY,
PRODUCT_NAME char(40),
PRICE int
);

-- Data imported from csv

SELECT * FROM products;

with cte as (
SELECT product_id, product_name, price,
	CASE
	 WHEN price<100 THEN 'Low price'
	 WHEN price between 100 and 500 THEN 'Medium price'
	 ELSE 'High price'
	END AS category
FROM products
)
SELECT category, count(*) as no_of_products
from cte
group by category
order by no_of_products desc;