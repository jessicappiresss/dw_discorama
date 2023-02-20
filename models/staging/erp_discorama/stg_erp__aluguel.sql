with
    source_rental as (
        select 
            cast(rental_id as int) as id_aluguel
            , cast(inventory_id as int) as id_inventario
            , cast(customer_id as int) as id_cliente
            , cast(staff_id as int) as id_funcionario
            , SUBSTRING(rental_date, 1, 10) as data_do_aluguel
            , SUBSTRING(return_date, 1, 10) as data_de_devolucao
           -- , last_update as ultima_atualizacao_aluguel		
        from {{ source('erp', 'rental')}}
    )
select *
from source_rental