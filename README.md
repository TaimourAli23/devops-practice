Steps to run locally:
- git clone https://github.com/TaimourAli23/devops-practice.git
- pip install -r requirements.txt                              
- python manage.py runserver                                   

Steps to run container:
- docker build -t my-project .
- docker run -p8000:8000 my-project
