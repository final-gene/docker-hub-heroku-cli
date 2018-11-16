FROM node:11-alpine

LABEL maintainer="frank.giesecke@final-gene.de"

ENV HEROKU_CLI_VERSION 7.18.9

# hadolint ignore=DL3018
RUN apk add --no-cache --virtual=.build-deps bash curl

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apk add --no-cache --virtual=.persistent \
        postgresql-client=10.5-r0

RUN curl https://cli-assets.heroku.com/install.sh | sh

RUN apk del .build-deps

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD [""]
