# Base image
FROM alpine:3.18

# Set working directory
WORKDIR /app

# Download PocketBase binary
ADD https://github.com/pocketbase/pocketbase/releases/download/v0.16.7/pocketbase_0.16.7_linux_amd64.zip /tmp/pocketbase.zip

# Install dependencies and extract binary
RUN apk add --no-cache unzip && \
    unzip /tmp/pocketbase.zip -d /app && \
    chmod +x /app/pocketbase && \
    rm /tmp/pocketbase.zip

# Expose default PocketBase port
EXPOSE 8090

# Command to start PocketBase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
