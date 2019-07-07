FROM golang:1.12

RUN go get -u -v golang.org/x/lint/golint && \
  go get -u -v github.com/mitchellh/gox && \
  go get github.com/itchio/gothub

COPY scripts/codecov.bash /usr/local/bin/codecov.bash

RUN chmod u+x /usr/local/bin/codecov.bash
