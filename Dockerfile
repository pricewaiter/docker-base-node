FROM mhart/alpine-node:6.11.1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN npm install -g yarn && /bin/rm -rf /tmp/npm* /root/.npm /root/.node-gyp

ONBUILD COPY package.json /usr/src/app/
ONBUILD COPY yarn.lock /usr/src/app/
ONBUILD RUN yarn install --production && /bin/rm -rf /tmp/npm* /root/.npm /root/.node-gyp
ONBUILD COPY . /usr/src/app

CMD yarn run start
