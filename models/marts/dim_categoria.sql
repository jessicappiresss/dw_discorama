-- atualizado e corrigido para o lighthouse 23-9
with
    categoria as (
        select *		
        from {{ ref('stg_erp__categoria') }}
    )

    , categoria_filme as (
        select *		
        from {{ ref('stg_erp__categoria_filme') }}
    )

    , uniao_tabelas as (
        select		
            categoria.id_categoria				
            , categoria.nome_categoria				
            , categoria_filme.id_filme							
                   
        from categoria_filme
        left join categoria on categoria_filme.id_categoria = categoria.id_categoria

    )    , transformacoes as (


        select
            row_number() over (order by id_categoria) as sk_categoria
            , *
        from uniao_tabelas
    )

select *
from transformacoes