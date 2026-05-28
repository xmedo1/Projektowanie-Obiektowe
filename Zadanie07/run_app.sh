#!/usr/bin/bash
echo "URL frontendu: http://127.0.0.1:8080/web/products"

docker build -t zadanie07-obiektowe .
docker run -it --rm -p 8080:8080 zadanie07-obiektowe