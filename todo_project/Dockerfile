<<<<<<< todo-app-new
FROM python:3.12.5-slim-bullseye
ENV DEPLOY_ENVIRONMENT='staging'
RUN echo Building $DEPLOY_ENVIRONMENT Container
RUN apt-get update && apt-get install -y build-essential gcc libpq-dev && \
        rm -rf /var/lib/apt/lists/*;
RUN groupadd --system todoapp && useradd --system -g todoapp todoapp
=======
FROM python:3.12.5-alpine3.19
RUN addgroup -S todoapp && adduser -S -G todoapp todoapp
>>>>>>> main
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY . /app/
<<<<<<< todo-app-new
RUN mkdir -p /app/logs
RUN chown --recursive todoapp:todoapp /app
USER todoapp

EXPOSE 8000

CMD ["/bin/sh", "-c", "\
    if [ \"$DEPLOY_ENVIRONMENT\" = \"production\" ]; then \
        uwsgi --ini uwsgi.ini; \
    elif [ \"$DEPLOY_ENVIRONMENT\" = \"staging\" ]; then \
        gunicorn --config gunicorn_config.py todo_project.wsgi:application; \
    fi"]

=======

#COPY entrypoint.sh /app/entrypoint.sh
#RUN chmod +x /app/entrypoint.sh

RUN chown -R todoapp:todoapp /app
USER todoapp

EXPOSE 8000
#ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
>>>>>>> main
