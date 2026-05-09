-- Daily report of the total revenue for a specific date.
SELECT
    '2026-04-01' AS order_date,
    SUM(o.total_amount) AS total_amount
FROM orders AS o
WHERE o.order_date >= '2026-04-01'
  AND o.order_date < '2026-04-02';

-- Monthly report of the top-selling products in a given month.
SELECT
    p.product_id,
    p.name,
    SUM(od.quantity) AS total_sales
FROM product AS p
JOIN order_details AS od
    ON od.product_id = p.product_id
JOIN orders AS o
    ON o.order_id = od.order_id
WHERE o.order_date >= '2026-04-01'
  AND o.order_date < '2026-05-01'
GROUP BY
    p.product_id,
    p.name
ORDER BY total_sales DESC;

-- Retrieve a list of customers who have placed orders totaling more than $500 in the past month.
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    SUM(o.total_amount) AS total_purchase_value
FROM customer AS c
JOIN orders AS o
    ON o.customer_id = c.customer_id
WHERE o.order_date >= '2026-03-01'
  AND o.order_date < '2026-04-01'
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING SUM(o.total_amount) > 500;

-- SQL query to search for all products with the word "camera" in either the product name or description.
SELECT 
    p.product_id,
    p.category_id,
    p.name,
    p.description,
    p.price,
    p.stock_quantity
FROM
    product p
WHERE
    p.name LIKE '%camera%' 
UNION SELECT 
    p.product_id,
    p.category_id,
    p.name,
    p.description,
    p.price,
    p.stock_quantity
FROM
    product p
WHERE
    p.description LIKE '%camera%'

-- a query to suggest popular products in the same category for the same author,
-- excluding the Purchased product from the recommendations?
SELECT 
    p.product_id,
    p.name,
    c.category_name,
    COUNT(od.product_id) AS sales
FROM
    product p
        JOIN
    order_details od ON od.product_id = p.product_id
        JOIN
    orders o ON od.order_id = o.order_id
        JOIN
    category c ON c.category_id = p.category_id
WHERE
    c.category_id = 3
        AND p.product_id NOT IN (SELECT 
            p.product_id
        FROM
            product p
                JOIN
            order_details od ON od.product_id = p.product_id
                JOIN
            orders o ON o.order_id = od.order_id
                JOIN
            customer c ON c.customer_id = o.customer_id
        WHERE
            c.customer_id = 4)
GROUP BY p.product_id , p.name
ORDER BY sales DESC
