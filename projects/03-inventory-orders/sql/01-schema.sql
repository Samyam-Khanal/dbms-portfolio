CREATE SCHEMA inventory;
CREATE TABLE inventory.product (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sku text NOT NULL UNIQUE,
    name text NOT NULL,
    price numeric(12,2) NOT NULL CHECK (price >= 0),
    stock integer NOT NULL CHECK (stock >= 0)
);
CREATE TABLE inventory.customer_order (
    id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ordered_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status text NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'paid', 'cancelled'))
);
CREATE TABLE inventory.order_item (
    order_id bigint REFERENCES inventory.customer_order(id),
    product_id bigint REFERENCES inventory.product(id),
    quantity integer NOT NULL CHECK (quantity > 0),
    unit_price numeric(12,2) NOT NULL CHECK (unit_price >= 0),
    PRIMARY KEY (order_id, product_id)
);
CREATE INDEX order_item_product_idx ON inventory.order_item(product_id);
-- One-product checkout: row lock, stock update, and order are atomic.
CREATE FUNCTION inventory.place_order(p_sku text, p_quantity integer)
RETURNS bigint LANGUAGE plpgsql AS $$
DECLARE
    p inventory.product%ROWTYPE;
    new_order bigint;
BEGIN
    IF p_quantity IS NULL OR p_quantity <= 0 THEN
        RAISE EXCEPTION 'Quantity must be positive';
    END IF;
    SELECT * INTO p FROM inventory.product WHERE sku = p_sku FOR UPDATE;
    IF NOT FOUND THEN RAISE EXCEPTION 'Unknown SKU'; END IF;
    IF p.stock < p_quantity THEN RAISE EXCEPTION 'Insufficient stock'; END IF;
    UPDATE inventory.product SET stock = stock - p_quantity WHERE id = p.id;
    INSERT INTO inventory.customer_order DEFAULT VALUES RETURNING id INTO new_order;
    INSERT INTO inventory.order_item VALUES (new_order, p.id, p_quantity, p.price);
    RETURN new_order;
END $$;
