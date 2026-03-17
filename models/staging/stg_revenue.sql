-- Staging model pro REVENUE tabulku
-- Materialized as table - připraveno pro incremental loading
-- Trimování stringových polí a filtrování NULL hodnot

with source as (
    select * from {{ source('crm_raw', 'revenue') }}
),

cleaned as (
    select
        id,
        date,
        revenue
        -- Pokud jsou stringové sloupce, přidej trim()
    from source
    where revenue is not null
      and date is not null
)

select * from cleaned
