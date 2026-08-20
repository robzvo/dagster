import time

from dagster import Definitions, job, op
from resources import dg_resources
from assets import dg_assets


@op
def my_op():
    time.sleep(30)
    return True


@job
def my_job():
    my_op()


defs = Definitions(
    jobs=[my_job],
    resources=dg_resources,
    assets = dg_assets
)