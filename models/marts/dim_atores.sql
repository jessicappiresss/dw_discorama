-- atualizado e corrigido para o lighthouse 23-9
with
    ator as (
        select *		
        from {{ ref('stg_erp__ator') }}
    )

    , filme_ator as (
        select *		
        from {{ ref('stg_erp__filme_ator') }}
    )

    , uniao_tabelas as (
        select		
            filme_ator.id_filme				
            , ator.id_ator
            , ator.primeiro_nome
            , ator.sobrenome				
                   
        from filme_ator
        left join ator on filme_ator.id_ator = ator.id_ator

    )    , transformacoes as (


        select
            row_number() over (order by id_ator) as sk_ator
            , *
        from uniao_tabelas
    )

select *
from transformacoes