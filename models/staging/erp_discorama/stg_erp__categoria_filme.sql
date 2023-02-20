with
    source_film_category as (
        select 
            cast(film_id as int) as id_filme				
            , cast(category_id as int) as id_categoria			
            , cast(last_update as date) as ultima_atualizacao		
        from {{ source('erp', 'film_category')}}
    )
select *
from source_film_category