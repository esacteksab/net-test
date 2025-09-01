FROM golang:1.25.0-trixie@sha256:a733d0a3a4c2349114bfaa61b2f41bfd611d5dc4a95d0d12c485ff385bd285b3

WORKDIR /go/src/app

COPY go.mod go.sum ./
RUN go get -d -v ./...

COPY main.go ./
RUN go build -o net-test main.go
RUN mv ./net-test /bin/

CMD ["net-test"]
