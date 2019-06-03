FROM mhart/alpine-node:12.3

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY package.json yarn.lock /usr/src/app/
ONBUILD RUN yarn install --network-timeout 1000000 --production && /bin/rm -rf /tmp/npm* /root/.npm /tmp/v8* /usr/local/share/.cache/
ONBUILD COPY . /usr/src/app

CMD yarn run start
