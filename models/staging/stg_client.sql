-- Staging model pro CLIENT tabulku
-- Materialized as table - připraveno pro incremental loading
-- Trimování všech stringových polí

with source as (
    select * from {{ source('crm_raw', 'client') }}
),

cleaned as (
    select
        id,
        trim(name) as name
        -- Přidej další stringové sloupce z tabulky CLIENT, pokud existují
    from source
)

select * from cleaned
