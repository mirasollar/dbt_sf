-- Faktová tabulka s měsíční agregací revenue
-- Materialized as table in CRM_MART schema

{{ config(
    materialized='table',
    tags=['fact', 'monthly']
) }}

with revenue_data as (
    select * from {{ ref('stg_revenue') }}
),

monthly_aggregation as (
    select
        id,
        date_trunc('month', date) as month,
        sum(revenue) as total_revenue,
        count(*) as transaction_count
    from revenue_data
    group by 
        id,
        date_trunc('month', date)
)

select * from monthly_aggregation
