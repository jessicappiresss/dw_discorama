with
    source_category as (
        select 
            cast(category_id as int) as id_categoria				
            , cast(name as string) as nome_categoria				
            , cast(last_update as date) as ultima_atualizacao		
        from {{ source('erp', 'category')}}
    )
select *
from source_category