from pathlib import Path

from dagster import Definitions

from my_project.defs.assets import dg_assets
from my_project.defs.jobs import dg_jobs
from my_project.resources import dg_resources


# @definitions
# def defs():
#     return load_from_defs_folder(path_within_project=Path(__file__).parent)

defs = Definitions(
    assets= dg_assets,
    jobs=dg_jobs,
    resources=dg_resources
)