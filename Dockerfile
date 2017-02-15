FROM alpine:3.4

RUN apk update \
  && apk add bash gawk sed grep bc coreutils git ca-certificates make curl \
  && rm -fr /var/cache/apk/*

RUN apk update \
  && curl --silent \
    --location https://github.com/sgerrand/alpine-pkg-R/releases/download/3.3.1-r0/R-3.3.1-r0.apk --output /var/cache/apk/R-3.3.1-r0.apk \
    --location https://github.com/sgerrand/alpine-pkg-R/releases/download/3.3.1-r0/R-dev-3.3.1-r0.apk --output /var/cache/apk/R-dev-3.3.1-r0.apk \
    --location https://github.com/sgerrand/alpine-pkg-R/releases/download/3.3.1-r0/R-doc-3.3.1-r0.apk --output /var/cache/apk/R-doc-3.3.1-r0.apk \
  && apk add --allow-untrusted \
    /var/cache/apk/R-3.3.1-r0.apk \
    /var/cache/apk/R-dev-3.3.1-r0.apk \
    /var/cache/apk/R-doc-3.3.1-r0.apk \
  && rm -fr /var/cache/apk/*
