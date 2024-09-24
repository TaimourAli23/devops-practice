FROM nginx:1.27.1
# Install pscops to use ps command
#RUN apt-get update  \
#    && apt-get install -y procps \
#    && rm -rf /var/lib/apt/lists/*;
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
