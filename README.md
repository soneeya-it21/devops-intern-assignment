# DevOps Internship Assignment: Nginx Reverse Proxy with Docker

## Overview
This project demonstrates a containerized microservices setup using Docker Compose, with an Nginx reverse proxy routing traffic to two backend services:
- **Service 1**: A Golang application running on port 8001.
- **Service 2**: A Python Flask application running on port 8002.

The system is orchestrated via Docker Compose and includes health checks, request logging, and an automated test script for validation.

## Project Structure
```
devops-intern-assignment/
+-- docker-compose.yml       # Defines services, networking, and health checks
+-- nginx/
¦   +-- nginx.conf          # Nginx reverse proxy configuration
¦   +-- Dockerfile          # Dockerfile for Nginx
+-- service_1/
¦   +-- main.go             # Golang application source
¦   +-- Dockerfile          # Dockerfile for Service 1
+-- service_2/
¦   +-- app.py              # Python Flask application source
¦   +-- Dockerfile          # Dockerfile for Service 2
+-- test.sh                 # Automated test script for endpoints
+-- README.md               # Project documentation
```

## Prerequisites
- Docker and Docker Compose installed ([installation guide](https://docs.docker.com/get-docker/))
- Git installed ([download](https://git-scm.com/download/win))
- A Bash-compatible environment for running `test.sh`:
  - Windows: Git Bash or Windows Subsystem for Linux (WSL)
  - Linux/macOS: Native terminal
- Ensure port 9090 is free (used by Nginx)

## Setup Instructions
1. Clone the repository:
   ```bash
   git clone <your-repo-url>
   cd devops-intern-assignment
   ```
2. Build and start all services:
   ```bash
   docker-compose up --build -d
   ```
3. Run the automated test script in a Bash-compatible terminal (e.g., Git Bash or WSL):
   ```bash
   ./test.sh
   ```
4. Access services via `http://localhost:9090`.

## Nginx Routing
Nginx acts as a reverse proxy, routing requests based on URL paths:
- `/service1/*` ? Golang backend (port 8001)
- `/service2/*` ? Python Flask backend (port 8002)

**Example Endpoints**:
- `http://localhost:9090/service1/ping` ? Returns `{"status":"ok","service":"1"}`
- `http://localhost:9090/service1/hello` ? Returns `{"message":"Hello from Service 1"}`
- `http://localhost:9090/service2/ping` ? Returns `{"status":"ok","service":"2"}`
- `http://localhost:9090/service2/hello` ? Returns `{"message":"Hello from Service 2"}`

## Features
- **Nginx Reverse Proxy**: Routes traffic based on URL paths.
- **Docker Compose**: Orchestrates Nginx, Service 1, and Service 2.
- **Health Checks**: Configured in `docker-compose.yml` to monitor service availability.
- **Request Logging**: Nginx logs?? in `/var/log/nginx/access.log`.
- **Automated Testing**: `test.sh` validates all endpoints, reporting success or failure.

## Tech Stack
- Docker
- Docker Compose
- Nginx
- Golang (Service 1)
- Python Flask (Service 2)

## Notes
- Port 9090 is used for Nginx to avoid conflicts with common ports like 8080 (e.g., used by Jenkins).
- This is a development setup. For production, consider using a WSGI server (e.g., Gunicorn) for the Flask service.
- On Windows, run `test.sh` in Git Bash or WSL due to Bash dependency.

## Troubleshooting
- **Port Conflict**: If port 9090 is in use, stop the conflicting service or modify `docker-compose.yml` to use another port.
- **Test Script Fails**: Ensure services are running (`docker-compose ps`) and `curl` is available in your Bash environment.
- **WSL Issues**: Install WSL with `wsl --install` and ensure a Linux distribution (e.g., Ubuntu) is set up.
- **Line Endings**: If `test.sh` fails on Linux/WSL, convert line endings:
  ```bash
  dos2unix test.sh
  ```

## Submission Checklist
- [x] Docker Compose configuration working
- [x] Nginx reverse proxy with path-based routing
- [x] Health checks for both services
- [x] Nginx request logging
- [x] Automated test script (`test.sh`)
- [x] Clean, modular project structure


## Screenshots 
![service 1 ping](https://github.com/user-attachments/assets/e1070e50-13ff-48f3-8acf-4b50b4822182)
![service 1 hello](https://github.com/user-attachments/assets/1f79b1ff-3b36-481a-8a3b-5ad5becb710e)
![service 2 ping](https://github.com/user-attachments/assets/f8f92e8d-b63f-4599-a174-189942c66b88)
![service 2 hello](https://github.com/user-attachments/assets/eeec0f97-ef52-4a4f-9846-d98a768b2081)
![build success](https://github.com/user-attachments/assets/6a31e995-29cf-4b4a-999a-180d0ae525de)
![docker container](https://github.com/user-attachments/assets/00378022-8f78-413d-aa3e-56c11f86c26b)
![test passes](https://github.com/user-attachments/assets/93d1a44a-1334-4f2a-951a-ba66c332a3c3)






