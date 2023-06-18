# Use the official Go image as the base
FROM golang:alpine3.18
# Set the working directory to /go/src/app
WORKDIR /go/src/app

# Copy the local files into the container
COPY build.sh go.sum gitlab.rb go.mod main.go rancher-gitlab-proxy.service rancher_gitlab_proxy ./
# Build the Go application
RUN go mod download github.com/julienschmidt/httprouter
RUN go mod download github.com/xanzy/go-gitlab@v0.40.2
RUN go get sandstorm.de/rancher-gitlab-proxy
RUN go build -o rancher_gitlab_proxy main.go
RUN GOOS=linux go build -o rancher_gitlab_proxy_linux main.go 
CMD ./rancher_gitlab_proxy_linux
# Expose port 80 for the application
EXPOSE 80
 

# Set the entry point for the container
# ENTRYPOINT ["./rancher-gitlab-proxy"]

