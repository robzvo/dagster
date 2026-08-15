# copy lock file first, sync dependencies
FROM python:3.12-slim AS builder
RUN pip install uv

WORKDIR /app
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-dev --no-install-project

COPY . .
RUN uv sync --frozen --no-dev

# copy source, sync again
FROM python:3.12-slim

COPY --from=builder /app /app
ENV PATH="/app/.venv/bin:$PATH"

WORKDIR /app