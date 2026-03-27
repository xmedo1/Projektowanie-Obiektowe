#!/usr/bin/bash

API_URL="http://localhost:8000/api"

echo "Test - POST"
curl -s -X POST "$API_URL/products" -H "Content-Type: application/json" -d '{"name": "Arbuz", "price": 15.0, "description": "Dobry na lato"}'
echo -e "\n"

echo "Test - GET (all)"
curl -s -X GET "$API_URL/products"
echo -e "\n"

echo "Test - GET (1)"
curl -s -X GET "$API_URL/products/1"
echo -e "\n"

echo "Test - PUT"
curl -s -X PUT "$API_URL/products/2" -H "Content-Type: application/json" -d '{"name": "Bardzo duze jablko", "price": 3.1}'
echo -e "\n"

echo -e "Test - DELETE"
curl -s -i -X DELETE "$API_URL/products/4" | grep "HTTP/"
echo -e "\n"

echo "Category - POST"
curl -s -X POST "$API_URL/categories" -H "Content-Type: application/json" -d '{"name": "Owoce"}'
echo -e "\n"

echo "User - POST"
curl -s -X POST "$API_URL/users" -H "Content-Type: application/json" -d '{"email": "jankowalski@email.com", "username": "jankowalski"}'

echo "Tests completed"