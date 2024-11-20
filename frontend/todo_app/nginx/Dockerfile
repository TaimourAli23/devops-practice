FROM nginx:1.27.1-alpine AS final
#COPY --from=build /app/dist /usr/share/nginx/html
COPY ./todo_app.conf /etc/nginx/default.conf

# Grant permissions to ngnix user and run as non-root
RUN chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx/conf.d
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid
# As the port below 80 can be only opened by root so we have to run a specfic user here
#USER nginx

EXPOSE 80