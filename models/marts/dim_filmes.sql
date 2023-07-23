-- atualizado e corrigido para o lighthouse 23-9
with
    filmes as (
        select *		
        from {{ ref('stg_erp__filmes') }}
    )

    , inventario as (
        select *		
        from {{ ref('stg_erp__inventario') }}
    )

    , uniao_tabelas as (
        select		
            filmes.id_filme	
            , inventario.id_inventario
            , filmes.id_idioma		
            , filmes.titulo				
            , filmes.descricao		
            , filmes.ano_lancamento		
            , filmes.duracao_aluguel			
            , filmes.taxa_aluguel			
            , filmes.duracao_filme_minutos			
            , filmes.custo_reposicao			
            , filmes.avaliacao 		
            , inventario.id_loja
        from inventario
        left join filmes on inventario.id_filme = filmes.id_filme

    )    , transformacoes as (


        select
            row_number() over (order by id_inventario) as sk_inventario
            , *
        from uniao_tabelas
    )

select *
from transformacoes
    