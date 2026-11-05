with orders as (
    select * from {{ ref("slv_sql_server_dbo__orders")}}
)
, promos as (
    select * from {{ ref("slv_sql_server_dbo__promos")}}
)
, addresses as (
    select * from {{ ref("slv_sql_server_dbo__addresses")}}
)


, joined as (
    select o.* exclude (promo_id, date_load),
           p.*,
           a.* exclude (address_id, date_load)
    from orders o
    join promos p on o.promo_id = p.promo_id
    join addresses a on a.address_id = o.address_id
)
select * from joined