# Use a minimal base image
FROM debian:bullseye-slim

# Application version
ARG APP_VERSION=v0.32.0

# Set working directory
WORKDIR /app

# Install necessary tools and clean up
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Download and extract the executor binary using the version variable
RUN wget https://github.com/t3rn/executor-release/releases/download/${APP_VERSION}/executor-linux-${APP_VERSION}.tar.gz \
    && tar -xzf executor-linux-${APP_VERSION}.tar.gz \
    && rm executor-linux-${APP_VERSION}.tar.gz

# Move the binary to a standard location and make it executable
# Find the actual executable and make it executable
RUN find . -type f -name "executor" -exec chmod +x {} \;

# Store the executable path
RUN find . -type f -name "executor" | head -n 1 > executable_path.txt

# Use the executable path in the entrypoint
ENTRYPOINT ["/bin/sh", "-c", "$(cat executable_path.txt)"]

# Default command (can be overridden)
CMD ["--help"]
