-- 1. view order_details table
SELECT * FROM order_details;

-- 2. date range of table
SELECT MIN(order_date), MAX(order_date) FROM order_details;

-- 3. how many orders made within this date range
SELECT COUNT(DISTINCT order_id) FROM order_details;

-- 4. how many items ordered within this date range
SELECT COUNT(*) FROM order_details;

-- 5. which orders had the most number of items
SELECT order_id, COUNT(item_id) AS num_items 
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;

-- 6. how many orders had more than 12 items
SELECT COUNT(*) FROM

(SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
HAVING num_items > 12) AS num_orders;
