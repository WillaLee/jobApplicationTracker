# Use an official Ubuntu 24.04 base image
FROM ubuntu:24.04

# Set environment variables
ENV GO_VERSION=1.21.0
ENV GOPATH=/go
ENV PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    libpq-dev \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Go
RUN curl -OL https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz \
    && rm go${GO_VERSION}.linux-amd64.tar.gz

# Install sqlc (for generating SQL code)
RUN curl -sSL https://github.com/kyleconroy/sqlc/releases/download/v1.17.2/sqlc_1.17.2_linux_amd64.tar.gz | tar -xvz -C /usr/local/bin

# Install Goose (for database migrations)
RUN curl -sSL https://github.com/pressly/goose/releases/download/v3.11.0/goose_Linux_x86_64.tar.gz | tar -xvz -C /usr/local/bin

# Create directory for Go project
WORKDIR /app

# Copy Go modules and dependencies
COPY go.mod go.sum ./
RUN go mod download

# Install chi and cors for your project
RUN go get -u github.com/go-chi/chi/v5
RUN go get -u github.com/go-chi/cors

# Copy source code
COPY . .

# initialize database
RUN goose postgres postgres://user:password@localhost:5431/jobApplications?sslmode=disable up

# Generate SQL queries using sqlc
RUN sqlc generate

# Build the Go project (produces the `jobApplicationTracker` binary)
RUN go build -o jobApplicationTracker ./cmd/jobApplicationTracker

# Expose port (for example, if your Go app serves on port 8080)
EXPOSE 8080

# Run the Go application when the container starts
CMD ["./jobApplicationTracker"]
