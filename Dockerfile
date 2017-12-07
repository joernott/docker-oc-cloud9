FROM registry.ott-consult.de/oc/node8
MAINTAINER Joern Ott <joern.ott@ott-consult.de>

ENV APP_USER=cloud9 \
    APP_UID=2005 \
    APP_GROUP=cloud9 \
    APP_GID=2005 \
    APP_HOME=/workspace

COPY src /

RUN /tmp/install/oc-cloud9.sh

EXPOSE 8000

ENTRYPOINT /entrypoint
