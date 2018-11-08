FROM node:10-alpine

LABEL maintainer="frank.giesecke@final-gene.de"

ENV HEROKU_CLI_VERSION 7.18.5

RUN apk add --no-cache --virtual=.build-deps bash

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apk add --no-cache --virtual=.persistent \
        postgresql-client=10.5-r0

RUN npm install -g heroku@"${HEROKU_CLI_VERSION}" \
    && npm cache clean --force

RUN apk del .build-deps

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD [""]
