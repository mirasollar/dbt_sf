-- Dimenzní tabulka pro klienty
-- Materialized as table in marts schema

{{ config(
    materialized='table',
    tags=['dimension']
) }}

with clients as (
    select * from {{ ref('stg_client') }}
),

final as (
    select
        *
        -- Přidej zde business logiku, agregace, joiny, atd.
    from clients
)

select * from final
