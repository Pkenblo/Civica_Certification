with orders as (
    select * from {{ ref("slv_sql_server_dbo__orders")}}
),

final as (
    select * exclude (is_deleted, date_load)
    from orders
)
select * from final