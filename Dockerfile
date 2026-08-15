# Use Python 3.12 as the base image
FROM python:3.12-slim

# Install uv & git
RUN pip install uv
RUN apt-get update && apt-get install -y git

# Sets up the working directory
WORKDIR /app

# Copy all project files into the image
COPY . /app/

# Create the virtual environment and install dependencies using uv
RUN uv venv /app/.venv
ENV PATH="/app/.venv/bin:$PATH"
RUN uv pip install --system -e ".[dev]"