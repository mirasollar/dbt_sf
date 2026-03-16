-- Faktová tabulka s měsíční agregací revenue
-- Materialized as table in marts schema

{{ config(
    materialized='table',
    tags=['fact', 'monthly']
) }}

with revenue_data as (
    select * from {{ ref('stg_revenue') }}
),

monthly_aggregation as (
    select
        client_id as id,
        date_trunc('month', revenue_date) as month,
        sum(revenue_amount) as total_revenue,
        count(*) as transaction_count
    from revenue_data
    group by 
        client_id,
        date_trunc('month', revenue_date)
)

select * from monthly_aggregation
