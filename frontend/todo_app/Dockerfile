FROM node:22-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install --force
COPY . /app/
RUN npm run build

FROM nginx:1.27.1-alpine AS final
COPY --from=build /app/dist /usr/share/nginx/html

COPY ./nginx/todo_app.conf /etc/ngnix/default.conf

EXPOSE 80
