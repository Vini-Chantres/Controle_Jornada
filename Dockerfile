FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code

#INSTALANDO DEPENDÊNCIAS
RUN apt-get update && apt-get install -y --no-install-recommends \
    unixodbc-dev \
    unixodbc \
    libpq-dev

RUN python -m pip install --upgrade pip
RUN python -m pip install --upgrade setuptools
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .