FROM golang:1.17-alpine

WORKDIR /app

COPY . .

# Initialize the module inside the container
RUN go mod init service1 && go build -o main .

EXPOSE 8001

CMD ["./main"]
