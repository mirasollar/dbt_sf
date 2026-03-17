{# 
    Toto makro řídí, do jakého schema se tabulky vytvoří.
    
    PROD prostředí (--target prod):
        staging modely → CRM_STAGING
        marts modely   → CRM_MART
    
    DEV prostředí (výchozí):
        staging modely → DEV_CRM_STAGING
        marts modely   → DEV_CRM_MART
    
    Tím se zajistí, že DEV a PROD data jsou oddělená.
#}

{% macro generate_schema_name(custom_schema_name, node) -%}
    {%- set default_schema = target.schema -%}
    
    {%- if target.name == 'prod' -%}
        {# PROD: Použij schema přímo bez prefixu #}
        {%- if custom_schema_name is none -%}
            {{ default_schema }}
        {%- else -%}
            {{ custom_schema_name }}
        {%- endif -%}
    {%- else -%}
        {# DEV: Přidej prefix pro oddělení #}
        {%- if custom_schema_name is none -%}
            {{ default_schema }}
        {%- else -%}
            {{ default_schema }}_{{ custom_schema_name }}
        {%- endif -%}
    {%- endif -%}

{%- endmacro %}
