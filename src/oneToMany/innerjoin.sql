-- IMPLICIT INNER JOIN
SELECT * FROM customers, orders
WHERE customers.id = orders.customer_id;

-- EXPLICIT INNER JOIN
SELECT * FROM customers
JOIN orders
  ON customers.id = orders.customer_id;

SELECT first_name, last_name, order_date, amount
FROM customers
JOIN orders
  ON customers.id = orders.customer_id
ORDER BY amount;

SELECT
  first_name,
  last_name,
  order_date,
  MAX(amount) AS max_amount
FROM customers
JOIN orders
  ON customers.id = orders.customer_id
GROUP BY orders.customer_id;
