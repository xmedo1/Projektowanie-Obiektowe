FROM debian:stable-slim
RUN apt-get update && apt-get install -y fpc 
WORKDIR /app
COPY zadanie01.pas .
RUN fpc zadanie01.pas
CMD ["./zadanie01"]
