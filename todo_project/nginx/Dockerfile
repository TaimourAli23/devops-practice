FROM nginx:1.27.1
RUN groupadd --system todoapp && useradd --system -g todoapp -u 100001 todoapp

COPY ./nginx/nginx.conf /etc/nginx/
#Gives read-only permissions to todoapp user
RUN chown root:todoapp /etc/nginx/nginx.conf
RUN chmod 640 /etc/nginx/nginx.conf

RUN mkdir -p /var/log/nginx/todo_project
RUN chown todoapp:todoapp /var/log/nginx/todo_project

#USER todoapp
EXPOSE 8080
