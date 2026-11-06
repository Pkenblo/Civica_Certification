{{
    config(
        severity='error',
        warn_if='>0',
        error_if='>10'
    )
}}
select i.order_id,
        o.order_id,
        i.product_id
from {{ref("fct_order_items")}} i
full join {{ref("fct_orders")}} o on i.order_id = o.order_id
where i.order_id is null or o.order_id is null