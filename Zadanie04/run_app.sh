#!/usr/bin/bash
echo "Sprawdz obecna pogode w Krakowie: http://127.0.0.1:8080/weather"

docker build -t zadanie04-obiektowe .
docker run --rm -p 8080:8080 zadanie04-obiektowe