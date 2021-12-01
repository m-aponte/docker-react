FROM node:16.13.0-alpine
WORKDIR /home/node
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=0 /home/node/build /usr/share/nginx/html