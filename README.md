# dbt_sf - Snowflake dbt Project

Tento projekt obsahuje dbt transformace pro Snowflake účet SA79270.

## Setup

### 1. Nainstaluj dbt

```bash
pip install dbt-core dbt-snowflake
```

### 2. Nakonfiguruj credentials

Uprav soubor `profiles.yml` v tomto projektu a doplň své Snowflake credentials:
- `user`: tvoje Snowflake uživatelské jméno
- `password`: tvoje Snowflake heslo
- `role`: tvoje role (např. ACCOUNTADMIN, SYSADMIN)
- `warehouse`: název warehouse

**DŮLEŽITÉ:** Soubor `profiles.yml` je v `.gitignore`, takže se nikdy necommituje na GitHub!

### 3. Test připojení

```bash
dbt debug
```

### 4. Spuštění modelů

```bash
# Spustí všechny modely
dbt run

# Spustí testy
dbt test

# Vygeneruje dokumentaci
dbt docs generate
dbt docs serve
```

## Struktura projektu

```
├── models/
│   ├── staging/     # Staging modely (views)
│   └── marts/       # Finální tabulky
├── tests/           # Data testy
├── macros/          # Reusable SQL makra
├── seeds/           # CSV soubory k načtení
└── snapshots/       # SCD Type 2 snapshots
```

## Prostředí

- **dev**: Development prostředí (schema: DBT_TEST)
- **prod**: Production prostředí (schema: DBT_PROD)

Změna prostředí:
```bash
dbt run --target prod
```

## Více informací

- [dbt dokumentace](https://docs.getdbt.com/)
- [dbt-snowflake dokumentace](https://docs.getdbt.com/reference/warehouse-setups/snowflake-setup)
