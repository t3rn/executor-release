# Executor Release

### Download the latest version of [Executor Binary](https://github.com/t3rn/executor-release/releases/)

### Follow the [Setup Guide](https://docs.t3rn.io/executor/become-an-executor/binary-setup) in our technical documentation or dive straight into the hands-on guide below for a quick and practical setup walkthrough.

# t3rn Executor Setup Guide

This guide provides step-by-step instructions for setting up the t3rn Executor. It can be either run as standalone binary or as docker image. For simplicity we added docker compose for one click deployment.

## Configure Executor

Most important and secure information in `exexecutor` `PRIVATE_KEY`. Make sure to keep it safe.

Please refer to documentation and [.envrc](./envrc)  to see available `executor` settings.

You can also override easily RPC_ENDPOINTS in [docker-compose.yml](./docker-compose.yml) file .

## Running Executor

### Running with docker-compose

Our image is hosted in [`ghcr`](https://github.com/t3rn/t3rn/pkgs/container/executor). 

Running latest executor.
`docker compose up`

> ⚠️ **Note**: It is not advised to use `latest` image as it can contain breaking changes. We strongly recommend pinning executor version in docker compose file.

### Running Binary

Once all configurations are set, start the executor:

```bash
./executor
```

#### Download and Installation

##### For Ubuntu
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

##### For macOS
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

#### Verification (Optional)

To verify the executor is running correctly:
1. Check the terminal output for any error messages
2. Monitor the logs using the configured log level
3. Verify network connections to enabled networks

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

# Create and start new session
tmux new -s t3rn-executor

# To detach: Press Ctrl + B, then D
# To reattach: tmux attach -t t3rn-executor
```

### Option 3: Using systemd (Ubuntu Only, For Advanced Users)
For a permanent solution that starts automatically on boot, you can create a systemd service. Contact your system administrator or refer to systemd documentation for setup.


## Troubleshooting

If you encounter issues:  
- Verify all environment variables are set correctly.  
- Ensure your private key is valid.  
- Check network connectivity to enabled networks.  
- Verify sufficient balance in your wallet for each network.  

For further assistance, join our [Discord community](https://discord.com/invite/S5kHFQTtp6) or watch the comprehensive [YouTube setup guide](https://youtu.be/KYFWwV6ZkLY).  


## Notes

- Available networks: `arbitrum-sepolia`, `base-sepolia`, `blast-sepolia`, `optimism-sepolia`, `l1rn`
- Supported network shortnames for RPC configuration: `arbt`, `bssp`, `blss`, `opsp`
