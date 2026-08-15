# copy lock file first, sync dependencies
FROM python:3.12-slim-trixie as builder
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-dev --no-install-project

COPY . /app
RUN uv sync --frozen --no-dev

# copy source, sync again
FROM python:3.12-slim-trixie

WORKDIR /app

COPY --from=builder /app/.venv /app/.venv
COPY --from=builder /app /app
ENV PATH="/app/.venv/bin:$PATH"

WORKDIR /app