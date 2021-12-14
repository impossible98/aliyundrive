FROM golang:1.17-alpine as alpha

WORKDIR /src/

COPY . ./

RUN apk add --no-cache bash make \
    && make build-linux-amd64

FROM alpine:3

ENV APP aliyundrive

WORKDIR /app/

COPY --from=alpha /src/dist/$APP-linux-amd64 /app/

CMD /app/$APP-linux-amd64
