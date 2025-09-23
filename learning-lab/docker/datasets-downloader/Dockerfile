FROM alpine:3.19
RUN apk add --no-cache bash curl wget
WORKDIR /app
COPY ../../datasets/download.sh ./download.sh
RUN chmod +x download.sh
ENTRYPOINT ["/app/download.sh"]
