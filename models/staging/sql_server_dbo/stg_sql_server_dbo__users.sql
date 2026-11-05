with source as (
    select * from {{ source('sql_server_dbo', 'users')}}
),

renamed as (
    select 
        user_id,
        first_name,
        last_name,
        email,
        phone_number,
        address_id,
        created_at,
        updated_at,
        coalesce(_fivetran_deleted, false)       as is_deleted,
        _loaded_at                               as date_load
    from source 
)

select * from renamed