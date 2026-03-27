#!/usr/bin/bash

API_URL="http://localhost:8000/api/products"

echo "Test - POST"
curl -s -X POST $API_URL -H "Content-Type: application/json" -d '{"name": "Arbuz", "price": 15.0, "description": "Dobry na lato"}'
echo -e "\n"

echo "Test - GET (all)"
curl -s -X GET $API_URL 
echo -e "\n"

echo "Test - GET (1)"
curl -s -X GET "$API_URL/1"
echo -e "\n"

echo "Test - PUT"
curl -s -X PUT "$API_URL/2" -H "Content-Type: application/json" -d '{"name": "Bardzo duze jablko", "price": 3.1}'
echo -e "\n"

echo -e "Test - DELETE"
curl -s -i -X DELETE "$API_URL/4" | grep "HTTP/"
echo -e "\n"

echo "Tests completed"