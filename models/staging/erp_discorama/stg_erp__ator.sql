-- atualizado e corrigido para o lighthouse 23-9
with
    source_actor as (
        select 
            cast(actor_id as int) as id_ator		
            , cast(first_name as string) as primeiro_nome		
            , cast(last_name as string) as sobrenome				
            , SUBSTRING(last_update, 1, 10) as ultima_atualizacao	
        from {{ source('erp', 'actor')}}
    )
select *
from source_actor   