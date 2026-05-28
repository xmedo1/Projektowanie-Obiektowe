FROM golang:1.26-bookworm

WORKDIR /app

COPY weather-app/ .

RUN go mod download

ENV CGO_ENABLED=1
RUN go build -o weather-app main.go

EXPOSE 8080

CMD ["./weather-app"]
