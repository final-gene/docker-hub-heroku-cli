FROM node:19-alpine

LABEL maintainer="frank.giesecke@final-gene.de"

ENV HEROKU_CLI_VERSION 7.52.0

RUN apk add --no-cache bash

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apk add --no-cache --virtual=.build-deps curl

RUN apk add --no-cache --virtual=.persistent \
    postgresql-client

RUN curl https://cli-assets.heroku.com/install.sh | sh

RUN apk del .build-deps

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD [""]
