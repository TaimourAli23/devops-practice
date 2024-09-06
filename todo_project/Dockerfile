FROM python:3.12.5-alpine3.19 AS final
RUN addgroup -S todoapp && adduser -S -G todoapp todoapp
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r requirements.txt
RUN ls
COPY . /app/

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

RUN chown -R todoapp:todoapp /app
USER todoapp

EXPOSE 8000
#ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]