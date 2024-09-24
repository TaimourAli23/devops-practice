FROM node:22-alpine3.19
WORKDIR /app
COPY package.json /app/package.json
RUN npm install
COPY . /app/
EXPOSE 3000