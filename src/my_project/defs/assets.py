import os
from dagster import asset, AssetExecutionContext
from dagster_snowflake import SnowflakeResource


@asset(code_version="v1")
def environment_variables(context: AssetExecutionContext):
    context.log.info(os.environ)


@asset(code_version="v1")
def snowflake_test(
    context: AssetExecutionContext,
    snowflake: SnowflakeResource
):
    current_directory = os.path.dirname(__file__)
    sql_file = os.path.join(current_directory,"sql","select_timestamp.sql")

    with open(sql_file,'r') as sqlfile:
        sql = sqlfile.read()

        with snowflake.get_connection() as conn:
            with conn.cursor() as cursor:
                results = cursor.execute(sql).fetchall()
                context.log.info(results)

dg_assets=[environment_variables, snowflake_test]