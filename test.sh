#!/bin/bash

# Base URL
BASE_URL="http://localhost:9090"

# Array of test endpoints
declare -a endpoints=(
    "/service1/ping"
    "/service1/hello"
    "/service2/ping"
    "/service2/hello"
)

echo "?? Running service tests..."

# Loop through all endpoints
for endpoint in "${endpoints[@]}"
do
    echo -n "Testing $BASE_URL$endpoint ... "
    response=$(curl -s -o /dev/null -w "%{http_code}" $BASE_URL$endpoint)
    if [ "$response" == "200" ]; then
        echo "? SUCCESS"
    else
        echo "? FAILED (HTTP $response)"
    fi
done

echo "?? All tests completed!"
