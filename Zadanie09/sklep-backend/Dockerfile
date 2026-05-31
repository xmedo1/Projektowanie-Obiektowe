FROM golang:1.26-alpine

WORKDIR /app

RUN apk add --no-cache gcc musl-dev

COPY . .

RUN go mod download

RUN CGO_ENABLED=1 go build -o server .

EXPOSE 8080

CMD ["./server"]