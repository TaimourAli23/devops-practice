FROM python:3.12.5-slim-bullseye
RUN groupadd --system todoapp && useradd --system -g todoapp todoapp
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY . /app/

#COPY entrypoint.sh /app/entrypoint.sh
#RUN chmod +x /app/entrypoint.sh

RUN chown --recursive todoapp:todoapp /app
# user wont be able to write to log files
# grant permissions
USER todoapp

EXPOSE 8000
#ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]