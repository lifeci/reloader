FROM busybox:1
WORKDIR /app
COPY ./loop.sh ./
ENTRYPOINT ["/bin/sh", "./loop.sh"]
