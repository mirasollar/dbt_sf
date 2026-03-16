# Nastavení GitHub Pages pro dbt dokumentaci

## Krok 1: Nastav GitHub Secrets

Jdi do tvého repository na GitHubu:
1. Klikni na **Settings** (nahoře)
2. V levém menu klikni na **Secrets and variables** → **Actions**
3. Klikni na **New repository secret**

Přidej následující secrets (hodnoty zkopíruj z tvého `profiles.yml`):

| Secret Name | Hodnota | Popis |
|-------------|---------|-------|
| `SNOWFLAKE_ACCOUNT` | `ZUQPYLZ-SA79270` | Snowflake account ID |
| `SNOWFLAKE_USER` | `MIROSLAV` | Tvoje Snowflake username |
| `SNOWFLAKE_PASSWORD` | `***` | Tvoje Snowflake heslo |
| `SNOWFLAKE_ROLE` | `SYSADMIN` | Snowflake role |
| `SNOWFLAKE_WAREHOUSE` | `COMPUTE_WH` | Warehouse name |
| `SNOWFLAKE_DATABASE` | `CRM_RAW` | Database name |
| `SNOWFLAKE_SCHEMA` | `DBT_PROD` | Schema pro produkci |

## Krok 2: Aktivuj GitHub Pages

1. V repository Settings
2. V levém menu klikni na **Pages**
3. V sekci **Source** vyber: **GitHub Actions**
4. Ulož

## Krok 3: Spusť workflow

Po push do `main` branch se automaticky:
1. Spustí GitHub Actions workflow
2. Vygeneruje dbt dokumentace
3. Nahraje ji na GitHub Pages

Dokumentace bude dostupná na:
**https://mirasollar.github.io/dbt_sf/**

## Ruční spuštění

Můžeš workflow spustit i manuálně:
1. Jdi na **Actions** tab v repository
2. Vyber **Generate and Deploy dbt Docs**
3. Klikni na **Run workflow**

---

**Poznámka:** Secrets jsou bezpečně uložené na GitHubu a nejsou viditelné v kódu ani v logs.
