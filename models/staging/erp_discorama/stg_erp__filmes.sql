-- atualizado e corrigido para o lighthouse 23-9
with
    source_film as (
        select 
            cast(film_id as int) as id_filme		
            , cast(language_id	as int)	as id_idioma		
            , cast(title as string) as titulo				
            , cast(description	as string) as descricao		
            , cast(release_year	as int)	ano_lancamento		
            , cast(rental_duration	as int) as duracao_aluguel			
            , cast(rental_rate as numeric) as taxa_aluguel			
            , cast(length as int) as duracao_filme_minutos			
            , cast(replacement_cost as numeric) as custo_reposicao			
            , cast(rating as string) as avaliacao 		
           -- , last_update as ultima_atualizacao_filmes			
            --, special_features				
            --, fulltext		
        from {{ source('erp', 'film')}}
    )
select *
from source_film    