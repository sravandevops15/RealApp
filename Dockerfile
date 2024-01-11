FROM node:13 as build
WORKDIR /apps
COPY package.json .
COPY package-lock.json .
RUN npm install && npm install react-scripts@3.4.1 -g --silent
RUN npm run  build

FROM nginx:stable-alpine
COPY --from=build /app/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
