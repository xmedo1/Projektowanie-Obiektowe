FROM swift:latest

RUN apt-get update && apt-get install -y libsqlite3-dev && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY ShopApp /app

RUN swift build -c release

EXPOSE 8080

CMD [".build/release/ShopApp", "serve", "--env", "production", "--hostname", "0.0.0.0", "--port", "8080"]