FROM mhart/alpine-node:8.0.0

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY package.json yarn.lock /usr/src/app/
ONBUILD RUN yarn install --production && /bin/rm -rf /tmp/npm* /root/.npm /root/.node-gyp
ONBUILD COPY . /usr/src/app

CMD yarn run start
