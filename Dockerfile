FROM node:16-alpine AS build
WORKDIR /app
COPY ./  /app/
RUN node -v
RUN npm install --legacy-peer-deps
RUN npm -v
RUN npm run build 

FROM nginx:1.26.0-alpine
EXPOSE 8080

