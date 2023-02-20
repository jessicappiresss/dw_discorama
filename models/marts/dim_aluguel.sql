with
    aluguel as (
        select *		
        from {{ ref('stg_erp__aluguel') }}
    )

    , pagamento as (
        select *		
        from {{ ref('stg_erp__pagamento') }}
    )

    , uniao_tabelas as (
        select		
            aluguel.id_aluguel
            , aluguel.id_inventario
            , aluguel.id_cliente
            , aluguel.id_funcionario
            , aluguel.data_do_aluguel
            , aluguel.data_de_devolucao
            , aluguel.ultima_atualizacao_aluguel
            , pagamento.id_pagamento
            , pagamento.valor_do_pagamento
            , pagamento.data_do_pagamento		
                   
        from aluguel
        left join pagamento on aluguel.id_aluguel = pagamento.id_aluguel

    )    , transformacoes as (


        select
            row_number() over (order by id_aluguel) as sk_aluguel
            , *
        from uniao_tabelas
    )

select *
from transformacoes