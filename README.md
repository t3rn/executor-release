- [Executor Release](#executor-release)
  - [Configure Executor](#configure-executor)
  - [Running Executor](#running-executor)
    - [Running with Docker Compose](#running-with-docker-compose)
    - [Running Binary](#running-binary)
    - [Installation](#installation)
      - [For Ubuntu](#for-ubuntu)
      - [For macOS](#for-macos)
    - [Verification (Optional)](#verification-optional)
  - [Running Executor in Background](#running-executor-in-background)
    - [Option 1: Using Screen (Recommended for Beginners)](#option-1-using-screen-recommended-for-beginners)
    - [Option 2: Using tmux (Modern Alternative)](#option-2-using-tmux-modern-alternative)
    - [Option 3: Using systemd (Ubuntu Only, For Advanced Users)](#option-3-using-systemd-ubuntu-only-for-advanced-users)
  - [Troubleshooting](#troubleshooting)


# Executor Release

This repository hold binary versions of [Executor Binary](https://github.com/t3rn/executor-release/releases/)  
Our Docker image is hosted in [`ghcr`](https://github.com/t3rn/t3rn/pkgs/container/executor)

Follow the [Executor Guide](https://docs.t3rn.io/executor/executor-overview) in our technical documentation or dive straight into the hands-on guide below for a quick and practical setup walkthrough.

## Configure Executor

The most important and sensitive information in `executor` is the `PRIVATE_KEY`. Make sure to keep it safe.

Please refer to the documentation and [.envrc](./.envrc) to see available `executor` settings.

You can also easily override RPC_ENDPOINTS in the [docker-compose.yml](./docker-compose.yml) file by editing the YAML.

## Running Executor

### Running with Docker Compose

Running the latest executor:  
`docker compose up`

> ⚠️ **Note**: It is not advised to use the `latest` image as it can contain breaking changes. We strongly recommend pinning the executor version in your Docker Compose file.

<details>
<summary>Running Binary</summary>

### Running Binary

Once all configurations are set, start the executor:

```bash
./executor
```

### Installation

#### For Ubuntu
```bash
mkdir t3rn && cd t3rn

# Download latest release
curl -s https://api.github.com/repos/t3rn/executor-release/releases/latest | \
grep -Po '"tag_name": "\K.*?(?=")' | \
xargs -I {} wget https://github.com/t3rn/executor-release/releases/download/{}/executor-linux-{}.tar.gz

# Extract the archive (will automatically use the downloaded version)
tar -xzf executor-linux-*.tar.gz

# Navigate to the executor binary location
cd executor/executor/bin
```

#### For macOS
```bash
mkdir t3rn && cd t3rn

# Download latest release
curl -s https://api.github.com/repos/t3rn/executor-release/releases/latest | \
grep -o '"tag_name": "[^"]*' | \
cut -d'"' -f4 | \
xargs -I {} curl -LO https://github.com/t3rn/executor-release/releases/download/{}/executor-macos-{}.tar.gz

# Extract the archive (will automatically use the downloaded version)
tar -xzf executor-macos-*.tar.gz

# Navigate to the executor binary location
cd executor/executor/bin
```

### Verification (Optional)

To verify the executor is running correctly:
1. Check the terminal output for any error messages.
1. Monitor the logs using the configured log level.
1. Verify network connections to enabled networks.

## Running Executor in Background

### Option 1: Using Screen (Recommended for Beginners)
Screen allows you to run the executor in the background and detach/reattach to the session:

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

### Option 3: Using systemd (Ubuntu Only, For Advanced Users)
For a permanent solution that starts automatically on boot, you can create a systemd service. Contact your system administrator or refer to systemd documentation for setup.

</details>

## Troubleshooting

If you encounter issues:  
- Verify all environment variables are set correctly.  
- Ensure your private key is valid (**always keep your private key secret and never reveal it to anyone**)  
- Check network connectivity to enabled networks.  
- Verify sufficient balance in your wallet for each network.  

For further assistance, join our [Discord community](https://discord.com/invite/S5kHFQTtp6) or watch the comprehensive [YouTube setup guide](https://youtu.be/KYFWwV6ZkLY).  
