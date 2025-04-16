-- 1. combine menu_items and order_details tables into a single table
SELECT * FROM menu_items;
SELECT * FROM order_details;

SELECT * 
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id;
    
-- 2. least and  most ordered items? what categories were they in
SELECT item_name, category, COUNT(order_details_id) AS num_purchases
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases;
-- chicken tacos least order (mexican)/ hamburger most ordered (american)

-- 3. top 5 orders that spent the most money
SELECT order_id, SUM(price) AS total_spend
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;

-- 4. view details of highest spend order. what insight can be gathered
SELECT category, COUNT(item_id) AS num_item
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category
ORDER BY num_item DESC;

-- 5. view details of top 5 highest orders, what insight can be gathered
SELECT order_id, category, COUNT(item_id) AS num_item
FROM order_details od LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY order_id, category
ORDER BY num_item DESC;