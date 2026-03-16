-- Staging model pro CLIENT tabulku
-- Materialized as view in staging schema

with source as (
    select * from {{ source('dbt_test', 'client') }}
),

cleaned as (
    select
        id,
        trim(name) as name,
        trim(email) as email
        -- Přidej další sloupce, které tabulka CLIENT obsahuje
    from source
)

select * from cleaned
