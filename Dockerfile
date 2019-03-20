FROM golang:latest

LABEL "name"="Hugo Pusher"
LABEL "maintainer"="Gergely Brautigam <gergely@gergelybrautigam.com>"
LABEL "version"="0.0.2"

LABEL "com.github.actions.name"="Hugo Blog Publisher"
LABEL "com.github.actions.description"="Push a hugo blog"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="green"

RUN \
  apt-get update && \
  apt-get install -y ca-certificates openssl git && \
  update-ca-certificates && \
  rm -rf /var/lib/apt

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["Skarlso/skarlso.github.io.git"]
