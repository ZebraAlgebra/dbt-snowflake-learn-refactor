with
source as (
    select *
    from {{ source("stripe", "payment") }}
),

transformed as (
    select
        source.id as payment_id,
        source.orderid as order_id,
        source.created as payment_created_at,
        source.status as payment_status,
        round(source.amount / 100.0, 2) as payment_amount
    from source
)

select * from transformed
