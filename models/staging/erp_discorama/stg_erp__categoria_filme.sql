with
    source_film_category as (
        select 
            cast(film_id as int) as id_filme				
            , cast(category_id as int) as id_categoria			
            , last_update as ultima_atualizacao_categoria_filme		
        from {{ source('erp', 'film_category')}}
    )
select *
from source_film_category