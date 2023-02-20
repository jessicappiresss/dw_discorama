with
    source_inventory as (
        select 
            cast(inventory_id as int) as id_inventario
            , cast(film_id as int) as id_filme
            , cast(store_id as int) as id_loja
            , last_update as ultima_atualizacao_inventario
        from {{ source('erp', 'inventory')}}
    )
select *
from source_inventory