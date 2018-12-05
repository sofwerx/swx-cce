# reference https://hub.docker.com/_/golang/
# reference https://docs.docker.com/engine/reference/builder/

# use the latest version of golang
FROM golang:stretch

ARG APP_REPO=""

ENV GOBIN="/go/src/app"
ENV APP_REPO=${APP_REPO}
ENV DB_HOST=""
ENV DB_NAME=""
ENV DB_USERNAME=""
ENV DB_PASSWORD=""
ENV DB_PORT=""

RUN mkdir -p /go/src/app
RUN git clone --depth=1 --branch=master ${APP_REPO} /go/src/app

WORKDIR /go/src/app
RUN go get -d -v ./...
RUN go install -v cmd/cceapp.go

EXPOSE 8080/tcp

CMD ["./cceapp"]
