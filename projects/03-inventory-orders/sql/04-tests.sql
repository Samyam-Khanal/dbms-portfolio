BEGIN;
DO $$
DECLARE before_stock integer; before_orders bigint; placed bigint;
BEGIN
    SELECT stock INTO before_stock FROM inventory.product WHERE sku = 'NOTE-01';
    IF before_stock <> 18 THEN RAISE EXCEPTION 'Expected seeded stock 18'; END IF;
    placed := inventory.place_order('NOTE-01', 3);
    IF (SELECT stock FROM inventory.product WHERE sku = 'NOTE-01') <> 15 THEN
        RAISE EXCEPTION 'Stock was not reduced';
    END IF;
    IF (SELECT sum(quantity * unit_price) FROM inventory.order_item WHERE order_id = placed) <> 450 THEN
        RAISE EXCEPTION 'Incorrect order total';
    END IF;
    SELECT count(*) INTO before_orders FROM inventory.customer_order;
    BEGIN
        PERFORM inventory.place_order('NOTE-01', 9999);
        RAISE EXCEPTION USING ERRCODE = 'ZX001', MESSAGE = 'Overselling accepted';
    EXCEPTION WHEN raise_exception THEN
        IF SQLERRM <> 'Insufficient stock' THEN RAISE; END IF;
    END;
    IF (SELECT count(*) FROM inventory.customer_order) <> before_orders
       OR (SELECT stock FROM inventory.product WHERE sku = 'NOTE-01') <> 15 THEN
        RAISE EXCEPTION 'Rejected order changed state';
    END IF;
END $$;
ROLLBACK;
