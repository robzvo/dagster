import os
from dagster import asset, AssetExecutionContext


@asset(code_version="v1")
def environment_variables(context: AssetExecutionContext):
    context.log.info(os.environ)