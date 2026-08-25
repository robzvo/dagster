import dagster as dg
from dagster_snowflake import SnowflakeResource

dg_resources = {
    'snowflake': SnowflakeResource(
                    account=dg.EnvVar("SNOWFLAKE_ACCOUNT"),
                    warehouse=dg.EnvVar("SNOWFLAKE_WAREHOUSE"),
                    user=dg.EnvVar("SNOWFLAKE_USER"),
                    role=dg.EnvVar("SNOWFLAKE_ROLE"),
                    private_key_path=dg.EnvVar("SNOWFLAKE_KEY_PATH")
                )
}