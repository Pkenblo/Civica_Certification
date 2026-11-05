with orders as (
    select * from {{ ref("stg_sql_server_dbo__orders")}}
),

cleaned as (
    select 
        order_id,
        user_id,
        address_id,
        promo_id,
        create_date,
        estimated_delivery_date,
        delivered_date,
        tracking_id,
        shipping_service,
        shipping_cost,
        order_cost_usd,
        order_total_usd,
        status,
        is_deleted,
        date_load
    from orders
    where not is_deleted
    qualify row_number() over (partition by order_id order by date_load desc) = 1
)
select * from cleaned