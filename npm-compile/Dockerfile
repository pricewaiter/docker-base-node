FROM mhart/alpine-node:6.9.1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk --update add python make g++ git && npm install -g yarn

ONBUILD COPY package.json /usr/src/app/
ONBUILD COPY yarn.lock /usr/src/app/
ONBUILD RUN yarn install --production && /bin/rm -rf /tmp/npm* /root/.npm /root/.node-gyp
ONBUILD COPY . /usr/src/app

CMD yarn run start
