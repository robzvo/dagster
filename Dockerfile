FROM python:3.12-slim
# Add any steps to install project system dependencies like java

# Install uv globally
RUN pip install uv

WORKDIR /opt/dagster/app

# Copy project specification files for caching
COPY pyproject.toml uv.lock ./

# Install dependencies into a virtual environment (.venv)
RUN uv sync --frozen --no-dev --no-install-project

COPY . /opt/dagster/app

# Complete synchronization (including local code discovery)
RUN uv sync --frozen --no-dev

# Add steps to install the Python dependencies for your Dagster project
# into the default Python on PATH
# For example, this project uses setup.py and we install all dependencies into the Docker container
# using `pip`.

RUN pip install -e .