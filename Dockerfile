FROM node:0.12-slim

RUN apt-get clean && apt-get update && apt-get -y --fix-missing install python build-essential

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY package.json /usr/src/app/
ONBUILD RUN npm install
ONBUILD COPY . /usr/src/app

CMD npm run start
