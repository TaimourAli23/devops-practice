Run locally:
- git clone https://github.com/TaimourAli23/devops-practice.git
- pip install -r requirements.txt                              
- python manage.py runserver                                   

Run container:
- docker build -t my-project .
- docker run -p8000:8000 my-project

Run compose file:
- docker compose --env-file .env up
- docker compose exec todo-app python migrate.py migrate

