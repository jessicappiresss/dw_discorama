-- atualizado e corrigido para o lighthouse 23-9
with
    aluguel as (
        select *
        from {{ ref('dim_aluguel') }}
    )

    , categoria as (
        select *
        from {{ ref('dim_categoria') }}
    )

    , filmes as (
        select *
        from {{ ref('dim_filmes') }}
    )

    , joined as (
        select 
            aluguel.sk_aluguel as fk_aluguel
            , categoria.sk_categoria as fk_categoria            
            , filmes.sk_inventario as fk_inventario            
            , aluguel.id_cliente
            , aluguel.id_funcionario
            , aluguel.data_do_aluguel
            , aluguel.data_de_devolucao
            , aluguel.id_pagamento
            , aluguel.valor_do_pagamento
            , aluguel.data_do_pagamento				
            , categoria.nome_categoria					
            , filmes.id_filme
            , filmes.id_idioma		
            , filmes.titulo				
            , filmes.descricao		
            , filmes.ano_lancamento		
            , filmes.duracao_aluguel			
            , filmes.taxa_aluguel			
            , filmes.duracao_filme_minutos			
            , filmes.custo_reposicao			
            , filmes.avaliacao 		
            , filmes.id_loja         
        from filmes
        left join categoria on categoria.id_filme = filmes.id_filme
        left join aluguel on aluguel.id_inventario = filmes.id_inventario
    )
    
select 
    fk_inventario || '-' || fk_aluguel as sk_discorama
    , *
from joined