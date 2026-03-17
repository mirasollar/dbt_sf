# dbt_sf - Snowflake dbt Project

Tento projekt obsahuje dbt transformace pro Snowflake databázi CRM_DATA.

## Snowflake Struktura

### Databáze: CRM_DATA

**Zdrojové schema (CRM_RAW):**
- `CLIENT` - Zdrojová tabulka klientů
- `REVENUE` - Zdrojová tabulka příjmů

**Staging schema (CRM_STAGING):**
- `stg_client` - Klienti s trimovanými stringy
- `stg_revenue` - Revenue s filtrováním NULL hodnot

**Marts schema (CRM_MART):**
- `dim_client` - Dimenzní tabulka klientů
- `fct_monthly_revenue` - Měsíční agregace revenue

## Setup

### 1. Nainstaluj dbt

```bash
pip install -r requirements.txt
```

### 2. Nakonfiguruj credentials

Soubor `profiles.yml` v tomto projektu je už připravený. Heslo je v souboru.

**DŮLEŽITÉ:** Soubor `profiles.yml` je v `.gitignore`, takže se nikdy necommituje na GitHub!

### 3. Test připojení

```bash
dbt debug
```

### 4. Spuštění modelů

```bash
# Nainstaluj dbt packages
dbt deps

# DEV prostředí - vytvoří tabulky v DEV_STAGING a DEV_MART
dbt run

# PROD prostředí - vytvoří tabulky v CRM_STAGING a CRM_MART
dbt run --target prod

# Spusť testy
dbt test

# Vygeneruj dokumentaci
dbt docs generate
dbt docs serve
```

## Prostředí

### DEV (výchozí)
- **Database:** CRM_DATA
- **Schema:** DEV_STAGING (staging modely), DEV_MART (marts modely)
- **Použití:** Lokální development a testování

### PROD
- **Database:** CRM_DATA
- **Schema:** CRM_STAGING (staging modely), CRM_MART (marts modely)
- **Použití:** Produkční data, spouští se automaticky při push do main

## Automatizace (GitHub Actions)

Při každém push do `main` branch se automaticky:
1. Spustí `dbt run --target prod` (vytvoří/aktualizuje tabulky v PROD)
2. Spustí `dbt test --target prod` (zkontroluje data quality)
3. Vygeneruje dokumentaci a nahraje ji na GitHub Pages

**Dokumentace dostupná na:** https://mirasollar.github.io/dbt_sf/

## Pracovní workflow

1. **Lokální development:** Proveď změny v modelech, spusť `dbt run` (jde do DEV)
2. **Testování:** Zkontroluj výsledky v DEV_STAGING a DEV_MART
3. **Commit & Push:** Nahraj změny do main branch
4. **Automatické nasazení:** GitHub Actions spustí modely do PROD (CRM_STAGING a CRM_MART)

## Více informací

- [dbt dokumentace](https://docs.getdbt.com/)
- [dbt-snowflake dokumentace](https://docs.getdbt.com/reference/warehouse-setups/snowflake-setup)
