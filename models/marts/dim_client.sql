-- Dimenzní tabulka pro klienty
-- Materialized as table in CRM_MART schema

{{ config(
    materialized='table',
    tags=['dimension']
) }}

with clients as (
    select * from {{ ref('stg_client') }}
),

final as (
    select
        id,
        name
        -- Přidej další sloupce podle potřeby
    from clients
)

select * from final
