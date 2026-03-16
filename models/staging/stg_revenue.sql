-- Staging model pro REVENUE tabulku
-- Materialized as view in staging schema

with source as (
    select * from {{ source('dbt_test', 'revenue') }}
),

cleaned as (
    select
        id::INTEGER as client_id,
        date::DATE as revenue_date,
        revenue::DECIMAL(10,2) as revenue_amount
    from source
    where revenue is not null
      and date is not null
)

select * from cleaned
