FROM golang:1.22.1

WORKDIR /app

COPY . .

RUN go mod download

COPY *.go ./

COPY tracker.db ./

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /my_app

EXPOSE 8080

CMD ["/my_app"]