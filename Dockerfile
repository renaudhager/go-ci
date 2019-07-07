FROM golang:1.12

RUN go get -u -v golang.org/x/lint/golint && \
  go get -u -v github.com/mitchellh/gox && \
  go get github.com/itchio/gothub

COPY scripts/* /usr/local/bin/

RUN chmod u+x \
  /usr/local/bin/codecov.bash \
  /usr/local/bin/publish_release.bash
