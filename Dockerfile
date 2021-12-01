FROM node:16.13.0-alpine
USER node
WORKDIR /home/node/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /home/node/app/build /usr/share/nginx/html