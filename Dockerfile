FROM node:alpine

WORKDIR '/usr/src/app'

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run install

FROM nginx
EXPOSE 80
COPY --from=builder/use/src/app/build /usr/share/nginx/html

