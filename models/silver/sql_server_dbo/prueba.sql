select user_id, _fivetran_synced
--from {{ source('sql_server_dbo', 'users')}}
from {{ source('sql_server_dbo', 'users') }}
limit 5