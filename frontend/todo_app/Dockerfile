FROM node:22-alpine3.19
WORKDIR /app
COPY package.json /app/package.json
RUN npm install
COPY . /app/
# RUN npm run build

# FROM nginx:1.27.1-alpine AS serve
# COPY --from=build /app/dist /var/www/html
# COPY ./nginx/todo_app.conf /etc/nginx/conf.d/
EXPOSE 3000

#CMD [ "npm", "run", "dev" ]