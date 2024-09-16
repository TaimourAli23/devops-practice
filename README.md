Run locally:
- git clone https://github.com/TaimourAli23/devops-practice.git
- pip install -r requirements.txt                              
- python manage.py runserver                                   

Run container:
- docker build -t my-project .
- docker run -p8000:8000 my-project

Run Staging :
- docker compose -f compose-staging.yml build
- dokcer compose -f compose-staging.yml up 
- docker compose -f compose-staging.yml run todo-app python migrate.py migrate

Run Production :
- docker compose -f compose-prod.yml build
- dokcer compose -f compose-prod.yml up 
- docker compose -f compose-prod.yml run todo-app python migrate.py migrate

