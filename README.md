- [Executor Release](#executor-release)
  - [Configuring the Executor](#configuring-the-executor)
  - [Running the Executor](#running-the-executor)
    - [Using Docker Compose](#using-docker-compose)
    - [Running the Binary](#running-the-binary)
    - [Installation](#installation)
      - [On Ubuntu](#on-ubuntu)
      - [On macOS](#on-macos)
    - [Verification (Optional)](#verification-optional)
  - [Running Executor in the Background](#running-executor-in-the-background)
    - [Option 1: Using Screen (Recommended for Beginners)](#option-1-using-screen-recommended-for-beginners)
    - [Option 2: Using tmux (Modern Alternative)](#option-2-using-tmux-modern-alternative)
    - [Option 3: Using systemd (Ubuntu Only, Advanced Users)](#option-3-using-systemd-ubuntu-only-advanced-users)
  - [Troubleshooting](#troubleshooting)


# Executor Release

This repository hosts binary versions of the [Executor](https://github.com/t3rn/executor-release/releases/).  
Our Docker image is available on [GitHub Container Registry](https://github.com/t3rn/t3rn/pkgs/container/executor).

Refer to the [Executor Guide](https://docs.t3rn.io/executor/executor-overview) in our technical documentation, or follow the hands-on guide below for a quick and practical setup.

## Configuring the Executor

The most important and sensitive information for the `executor` is the `PRIVATE_KEY`. Make sure to keep it secure.

Please refer to the documentation to see all available `executor` settings.

You can also override `RPC_ENDPOINTS` in the [docker-compose.yml](./docker-compose.yml) file by editing the YAML.

## Running the Executor

### Using Docker Compose

To run the latest executor image:  
```bash
docker compose up
```

> ⚠️ **Note**: Using the `latest` image is not recommended as it may contain breaking changes. We strongly suggest pinning the executor version in your Docker Compose file.

### Running the Binary

Once all configurations are set, start the executor with:

```bash
./executor
```

### Installation

#### On Ubuntu
```bash
mkdir t3rn && cd t3rn

# Download the latest release
curl -s https://api.github.com/repos/t3rn/executor-release/releases/latest | \
grep -Po '"tag_name": "\K.*?(?=")' | \
xargs -I {} wget https://github.com/t3rn/executor-release/releases/download/{}/executor-linux-{}.tar.gz

# Extract the archive
tar -xzf executor-linux-*.tar.gz

# Navigate to the executor binary location
cd executor/executor/bin
```

#### On macOS
```bash
mkdir t3rn && cd t3rn

# Download the latest release
curl -s https://api.github.com/repos/t3rn/executor-release/releases/latest | \
grep -o '"tag_name": "[^"]*' | \
cut -d'"' -f4 | \
xargs -I {} curl -LO https://github.com/t3rn/executor-release/releases/download/{}/executor-macos-{}.tar.gz

# Extract the archive
tar -xzf executor-macos-*.tar.gz

# Navigate to the executor binary location
cd executor/executor/bin
```

### Verification (Optional)

To verify the executor is running correctly:
1. Check the terminal output for any error messages.
2. Monitor the logs using the configured log level.
3. Verify network connections to enabled networks.

## Running Executor in the Background

### Option 1: Using Screen (Recommended for Beginners)
Screen allows you to run the executor in the background and detach or reattach to the session:

```bash
# Install screen (Ubuntu)
sudo apt-get install screen

# Create and start a new screen session
screen -S t3rn-executor

# To detach: Press Ctrl + A, then D
# To reattach: screen -r t3rn-executor
```

### Option 2: Using tmux (Modern Alternative)
tmux is a modern terminal multiplexer with similar functionality to screen:

```bash
# Install tmux (Ubuntu)
sudo apt-get install tmux

# Create and start a new session
tmux new -s t3rn-executor

# To detach: Press Ctrl + B, then D
# To reattach: tmux attach -t t3rn-executor
```

### Option 3: Using systemd (Ubuntu Only, Advanced Users)
For a permanent solution that starts automatically on boot, you can create a systemd service. Contact your system administrator or refer to the systemd documentation for setup.


## Troubleshooting

If you encounter issues:  
- Verify all environment variables are set correctly.  
- Ensure your private key is valid (**always keep your private key secret and never reveal it to anyone**).  
- Check network connectivity to enabled networks.  
- Ensure your wallet has sufficient balance for each network.  

For further assistance, join our [Discord community](https://discord.com/invite/S5kHFQTtp6) or watch the comprehensive [YouTube setup guide](https://youtu.be/KYFWwV6ZkLY).
