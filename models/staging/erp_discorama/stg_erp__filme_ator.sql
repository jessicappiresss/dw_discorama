-- atualizado e corrigido para o lighthouse 23-9
with
    source_film_actor as (
        select 
            cast(actor_id as int) as id_ator		
            , cast(film_id as int) as id_filme						
           -- , SUBSTRING(last_update, 1, 10) as ultima_atualizacao	
        from {{ source('erp', 'film_actor')}}
    )
select *
from source_film_actor   