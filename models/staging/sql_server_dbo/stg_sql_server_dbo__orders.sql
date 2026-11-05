with source as (
    select * from {{ source('sql_server_dbo', 'orders')}}
),

renamed as (
    select 
        order_id,
        user_id,
        address_id,
        promo_id,
        created_at                  as create_date,
        estimated_delivery_at       as estimated_delivery_date,
        delivered_at                as delivered_date,
        tracking_id,
        shipping_service,
        shipping_cost,
        order_cost                  as order_cost_usd,
        order_total                 as order_total_usd,
        status,
        coalesce(_fivetran_deleted, false)       as is_deleted,
        _fivetran_synced                         as date_load,
    from source 
)

select * from renamed