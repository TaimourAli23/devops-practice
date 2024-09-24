FROM nginx:1.27.1
# Install pscops to use ps command
#RUN apt-get update  \
#    && apt-get install -y procps \
#    && rm -rf /var/lib/apt/lists/*;
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
# Grant permissions to ngnix user and run as non-root
RUN chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx/conf.d
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid
USER nginx
EXPOSE 80
