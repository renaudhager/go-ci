FROM golang:1.12

RUN go get -u -v golang.org/x/lint/golint && \
  go get -u -v github.com/mitchellh/gox

COPY scripts/codecov.bash /usr/local/bin/codecov.bash

RUN chmod u+x /usr/local/bin/codecov.bash
