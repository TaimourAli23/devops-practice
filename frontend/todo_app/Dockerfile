FROM node:22-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install --force
COPY . /app/
RUN npm run build

FROM nginx:1.27.1-alpine AS final
COPY --from=build /app/dist /usr/share/nginx/html
COPY ./nginx/todo_app.conf /etc/ngnix/default.conf

# Grant permissions to ngnix user and run as non-root
RUN chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    chown -R nginx:nginx /etc/nginx/conf.d
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid
USER nginx

EXPOSE 80
