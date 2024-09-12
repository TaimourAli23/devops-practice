FROM python:3.12.5-slim-bullseye
RUN apt-get update  \
    && apt-get install -y \
    build-essential \
    gcc \
    libpq-dev  \
    && rm -rf /var/lib/apt/lists/*;
RUN groupadd --system todoapp && useradd --system -g todoapp todoapp
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY . /app/
RUN chown --recursive todoapp:todoapp /app

RUN mkdir -p /var/log/todo_project
RUN chown todoapp:todoapp /var/log/todo_project

USER todoapp

EXPOSE 8000
