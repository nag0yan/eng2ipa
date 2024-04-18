FROM python:3.12
WORKDIR /app

COPY ./poetry.lock ./poetry.lock
COPY ./pyproject.toml ./pyproject.toml
COPY ./src ./src

RUN pip install --upgrade pip
RUN pip install poetry
RUN poetry install

CMD ["poetry", "run", "uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "80"]
