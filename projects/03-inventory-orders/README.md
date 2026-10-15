# Inventory & order management

Track product stock and historical order-line prices. `inventory.place_order(sku, quantity)` locks one product, rejects unavailable stock, and creates a pending order while decrementing stock in the same transaction. Pending orders reserve stock in this starter.

The synthetic fixture starts with 20 notebooks and 50 pens, then orders two notebooks. Expected remaining notebook stock is 18 and the order total is 300.00. Currency is a single unspecified local currency; document your choice before extending the model.

This function supports one product per order. Cancellation/restocking, payments, customers, multi-item checkout, and idempotency are not implemented. Direct table writes can bypass the checkout workflow; a production access layer would need restricted permissions.

For a concurrency rehearsal, open two psql sessions. In A: `BEGIN; SELECT inventory.place_order('NOTE-01', 10);` Keep A open. In B, issue the same call; it should wait. Commit A; B should reject insufficient stock. The successful reservation consumes stock, so use a separate disposable database and rebuild the fixture for repeat experiments. Record actual behavior rather than assuming a pass.

Run root setup and tests as described in the main README. See [ERD](docs/erd.md) and [design notes](docs/design.md).
