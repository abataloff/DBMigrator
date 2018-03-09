FROM golang:1.9

RUN \
    go get github.com/rubenv/sql-migrate && \
    cd /go/src/github.com/rubenv/sql-migrate/sql-migrate && \
    go get -v && \
    go build -o sql-migrate

ENTRYPOINT ["/go/bin/sql-migrate", "up", "-config=/root/migrations/config.yml"]