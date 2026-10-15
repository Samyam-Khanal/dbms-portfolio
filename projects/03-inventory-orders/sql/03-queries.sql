SELECT o.id, o.status, sum(i.quantity * i.unit_price) AS order_total
FROM inventory.customer_order o JOIN inventory.order_item i ON i.order_id = o.id
GROUP BY o.id ORDER BY o.id;
SELECT sku, name, stock, price * stock AS stock_value
FROM inventory.product ORDER BY sku;
-- A rehearsal: no lasting order or stock mutation.
BEGIN;
SELECT inventory.place_order('PEN-01', 3);
ROLLBACK;
