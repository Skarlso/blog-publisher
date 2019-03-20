FROM golang:latest

LABEL "name"="Hugo Pusher"
LABEL "maintainer"="Gergely Brautigam <gergely@gergelybrautigam.com>"
LABEL "version"="0.1.0"

LABEL "com.github.actions.name"="Go Pusher"
LABEL "com.github.actions.description"="Push a hugo blog"
LABEL "com.github.actions.icon"="package"
LABEL "com.github.actions.color"="#E0EBF5"

RUN \
  apt-get update && \
  apt-get install -y ca-certificates openssl git && \
  update-ca-certificates && \
  rm -rf /var/lib/apt

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["Skarlso/skarlso.github.io.git"]
