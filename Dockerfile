#stage 1
From node:latest as node
WORKDIR /app
RUN npm install -g @angular/cli
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
EXPOSE 4200
CMD ["ng", "serve", "--host", "0.0.0.0"]

#stage 2
#FROM nginx:latest
#COPY --from=node /app/dist/my-angular-app /usr/share/nginx/html
#EXPOSE 80