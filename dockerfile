ARG goVer=1.14
ARG alpineVer=3.12
# FROM hub.docker.prod.walmart.com/library/golang:${goVer}
FROM golang:${goVer}-alpine${alpineVer}
RUN mkdir -p /go/src/server-titan-nats-cloud-availability
COPY ./server-titan-nats-cloud-availability /go/src/server-titan-nats-cloud-availability
RUN ls -lrth  /go/src/server-titan-nats-cloud-availability

RUN addgroup -g 10000 app; adduser -S -s /sbin/nologin -D -u 10000 -g 10000 app -G app
RUN chown -R app:app /go/src/server-titan-nats-cloud-availability
RUN chmod 777 /go/src/server-titan-nats-cloud-availability
USER 10000
WORKDIR /go/src/server-titan-nats-cloud-availability
# GOSUMDB=off CGO_ENABLED=0 GOOS=darwin go build
# GOSUMDB=off CGO_ENABLED=0 GOOS=linux go build

CMD ./server-titan-nats-cloud-availability