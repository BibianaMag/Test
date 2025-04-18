FROM node:16-alpine AS build
WORKDIR /app
COPY ./  /app/
RUN node -v
RUN npm install --legacy-peer-deps
RUN npm -v
RUN npm run build 

FROM nginx:1.26.0-alpine
EXPOSE 8080
COPY ./src/ssl/ /usr/share/nginx/html/ssl
COPY --from=build /app/dist/e-ops /usr/share/nginx/html
COPY ./default.conf /etc/nginx/conf.d/default.conf

