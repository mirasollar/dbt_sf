-- Staging model pro REVENUE tabulku
-- Trimování stringových polí a type casting

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
