FROM golang:1.26-bookworm

WORKDIR /app

COPY . .

RUN go mod download

RUN go build -o server main.go

EXPOSE 8080

CMD ["./server"]