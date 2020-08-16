FROM python:3.8-slim as builder

WORKDIR /app

RUN pip install poetry

COPY pyproject.toml poetry.lock ./

RUN poetry export -f requirements.txt > requirements.txt


FROM python:3.8-slim

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY --from=builder /app/requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE 4000
CMD [ "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "4000"]
