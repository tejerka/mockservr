FROM node:10-alpine

COPY ./app /usr/src/app

RUN apk add --no-cache --virtual .gyp \
        python \
        make \
        g++

RUN cd /usr/src/app && \
    npm install --production

RUN cd /usr/src/app/gui && \
    npm install --production

RUN rm -rf /usr/src/app/gui

EXPOSE 80
EXPOSE 4580

VOLUME /usr/src/app/mocks

WORKDIR /usr/src/app

CMD ["node",  "app.js"]
