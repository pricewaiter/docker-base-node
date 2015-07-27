FROM node:0.12-slim

RUN apt-get clean \
    && apt-get update \
    && apt-get -y --fix-missing --no-install-recommends install \
        g++ \
        graphicsmagick \
        libc-dev \
        make \
        python-minimal \
    && apt-get purge -y \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY package.json /usr/src/app/
ONBUILD RUN npm install
ONBUILD COPY . /usr/src/app

CMD npm run start
