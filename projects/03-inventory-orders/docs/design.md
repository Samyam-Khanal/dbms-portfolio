# Inventory design notes

## Starter decisions

An order line stores its unit price at checkout so later catalog price changes do not rewrite history. Stock cannot be negative. The checkout function locks the product row before checking stock, and all writes belong to the caller's transaction. It uses invoker permissions rather than elevated privileges.

The current mutable stock counter has no movement audit trail. The schema allows status changes but does not implement a cancellation workflow. These are explicit learning extensions.

## Complete during learning

- Currency and rounding rules:
- Data dictionary and normalization reasoning:
- Pending, paid, cancelled, and restocking rules:
- Multi-item lock ordering and idempotency design:
- Tests and concurrent checkout evidence:
- Reconciliation query and actual results:
- Limitations and next migration:

Use [the case study template](../../../docs/project-template.md) for the final write-up.
