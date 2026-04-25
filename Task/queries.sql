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