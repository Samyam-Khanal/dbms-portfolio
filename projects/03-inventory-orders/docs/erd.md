# Inventory ERD

```mermaid
erDiagram
    CUSTOMER_ORDER ||--o{ ORDER_ITEM : contains
    PRODUCT ||--o{ ORDER_ITEM : sold_as
    PRODUCT {
        bigint id PK
        text sku UK
        text name
        numeric price
        integer stock
    }
    CUSTOMER_ORDER {
        bigint id PK
        timestamptz ordered_at
        text status
    }
    ORDER_ITEM {
        bigint order_id PK,FK
        bigint product_id PK,FK
        integer quantity
        numeric unit_price
    }
```

The schema permits empty orders through direct writes; place_order creates one line atomically. Template for extensions: show customer and movement-ledger relationships as you implement them.
