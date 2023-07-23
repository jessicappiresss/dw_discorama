-- atualizado e corrigido para o lighthouse 23-9
with
    source_payment as (
        select 
            cast(payment_id as int) as id_pagamento
            , cast(customer_id as int) as id_cliente
            , cast(staff_id as int) id_funcionario
            , cast(rental_id as int) id_aluguel
            , cast(amount as numeric) as valor_do_pagamento
            , SUBSTRING(payment_date, 1, 10) as data_do_pagamento
        from {{ source('erp', 'payment')}}
    )
select *
from source_payment