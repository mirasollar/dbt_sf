-- Staging model pro CLIENT tabulku
-- Materialized as view in staging schema

with source as (
    select * from {{ source('dbt_test', 'client') }}
),

renamed as (
    select
        *
        -- Zde můžeš přidat transformace, přejmenování sloupců, atd.
    from source
)

select * from renamed
