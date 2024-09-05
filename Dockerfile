FROM python:3.12.5-alpine3.19 AS final
RUN addgroup -S myproject && adduser -S -G myproject myproject
WORKDIR /app
COPY requirements.txt /app/
RUN pip install -r requirements.txt
COPY . /app/
RUN chown -R myproject:myproject /app
USER myproject
EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]