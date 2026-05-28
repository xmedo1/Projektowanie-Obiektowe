#!/usr/bin/bash
echo "Uruchamiam serwer, wejdź na adres: "http://127.0.0.1:8000/api/[products, categories lub users]""

docker run -p 8000:8000 -v "$(pwd):/app" -w /app kprzystalski/projobj-php:latest bash -c "cd project && symfony server:start"