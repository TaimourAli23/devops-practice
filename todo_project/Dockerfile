FROM python:3.12.5-slim-bullseye
RUN apt-get update  \
    && apt-get install -y \
    python \
    build-essential \
    gcc-10 \
    libpq-dev \
    postgresql-client-13.*\
    && rm -rf /var/lib/apt/lists/*;
# build-essential: Provides necessary tools to compile software.
# gcc: Compiles C/C++ code and other language support.
# libpq-dev: Development files for building PostgreSQL-dependent applications.
# postgresql-client: PostgreSQL client for database interactions and management.

RUN groupadd --system todoapp && useradd --system -g todoapp -u 100001 todoapp
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY . /app/

# Without recursive flag the ownership of files inside app wont change
RUN chown --recursive todoapp:todoapp /app

RUN mkdir -p /var/log/todo_project
RUN chown todoapp:todoapp /var/log/todo_project

USER todoapp
EXPOSE 8000


#FROM nginx:1.27.1-alpine AS final
#WORKDIR /app
#COPY --from=build /app /app


