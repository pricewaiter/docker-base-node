FROM mhart/alpine-node:6.11.1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN apk --update add python make g++ git && npm install -g yarn \
    && /bin/rm -rf /var/cache/ /tmp/npm* /root/.npm /tmp/v8* /usr/local/share/.cache/

ONBUILD COPY package.json yarn.lock /usr/src/app/
ONBUILD RUN yarn install --production && /bin/rm -rf /tmp/npm* /root/.npm /tmp/v8* /usr/local/share/.cache/
ONBUILD COPY . /usr/src/app

CMD yarn run start
