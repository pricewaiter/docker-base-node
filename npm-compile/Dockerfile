FROM mhart/alpine-node:5.7.0

RUN apk --update add python make g++ git && \
    /bin/rm -rf /tmp/* /var/cache/apk/* \
    find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf && \
    rm -rf /usr/share/man /tmp/* /root/.npm /root/.node-gyp \
      /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY package.json /usr/src/app/
ONBUILD RUN npm install --no-optional && /bin/rm -rf /tmp/npm* /root/.npm /root/.node-gyp
ONBUILD COPY . /usr/src/app

CMD npm run start
