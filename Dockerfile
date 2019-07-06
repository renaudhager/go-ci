FROM golang:1.12

RUN go get -u -v golang.org/x/lint/golint && \
  go get -u -v github.com/mitchellh/gox
