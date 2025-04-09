with
source as (
    select *
    from {{ source("jaffle_shop", "orders") }}
),

transformed as (
    select
        source.id as order_id,
        source.user_id as customer_id,
        source.order_date as order_placed_at,
        source.status as order_status
    from source
)

select * from transformed
