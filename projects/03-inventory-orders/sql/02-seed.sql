INSERT INTO inventory.product(sku, name, price, stock) VALUES
('NOTE-01', 'Demo Notebook', 150.00, 20),
('PEN-01', 'Demo Pen', 25.00, 50);
-- Opening stocks above are BEFORE this synthetic sale.
SELECT inventory.place_order('NOTE-01', 2);
