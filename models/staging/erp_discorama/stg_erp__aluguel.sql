with
    source_rental as (
        select 
            cast(rental_id as int) as id_aluguel
            , cast(inventory_id as int) as id_inventario
            , cast(customer_id as int) as id_cliente
            , cast(staff_id as int) as id_funcionario
            , cast(rental_date as numeric) as data_do_aluguel
            , cast(return_date as numeric) as data_de_devolucao
            , cast(last_update as numeric) as ultima_atualizacao_aluguel		
        from {{ source('erp', 'rental')}}
    )
select *
from source_rental