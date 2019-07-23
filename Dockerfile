FROM alpine:latest
WORKDIR /app
COPY ./loop.sh ./
ENTRYPOINT ["/bin/sh", "./loop.sh"]
