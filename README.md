# Executor Release

### Download the latest version of [Executor Binary](https://github.com/t3rn/executor-release/releases/)

### Follow the [Setup Guide](https://docs.t3rn.io/executor/become-an-executor/binary-setup) in our technical documentation or dive straight into the hands-on guide below for a quick and practical setup walkthrough.


# t3rn Executor Setup Guide

This guide provides step-by-step instructions for setting up the t3rn Executor. It can be either run as standalone binary or as docker image. For simplicity we added docker compose for one click deployment.

### Configure Executor

```bash
# Node Environment
export NODE_ENV=testnet

# Logging Configuration
export LOG_LEVEL=debug
export LOG_PRETTY=false
```

#### Private Key Configuration
```bash
# Set your private key (replace with your actual private key)
export PRIVATE_KEY_LOCAL=your_private_key_here
```

> ⚠️ **Security Note**: We strongly recommend using a dedicated wallet for your Executor role, separate from your primary wallet.

#### Network and Asset Configuration
```bash
export EXECUTOR_ENABLED_NETWORKS='arbitrum,binance,ethereum,optimism,base,linea'
export EXECUTOR_ENABLED_ASSETS='eth,bnb'
```

#### RPC Configuration

Configure custom RPCs

```bash
export RPC_ENDPOINTS='{"l0rn":[],"l1rn":[],"l2rn":[],"l3rn":[],"zero":[],"t1rn":[],"t2rn":[],"t3rn":[],"lol3":[],"lold":[],"lols":[],"arbm":[],"arbt":[],"basm":[],"bast":[],"bsct":[],"bscm":[],"ethm":[],"sept":[],"linm":[],"lint":[],"optm":[],"opst":[],"absm":[],"monm":[],"mont":[],"abst":[],"berm":[],"bert":[],"lskm":[],"lskt":[],"ctim":[],"ctit":[],"unim":[],"unit":[],"blsm":[],"blst":[],"scrm":[],"scrt":[]}'  
```

## Running with Docker image

Running latest executor.
`docker compose up`

> ⚠️ **Note**: We strongly recommend pinning executor version in docker compose file.

## Running Binary

### Initial Setup

First, create and navigate to the t3rn directory:

```bash
mkdir t3rn
cd t3rn
```

### Download and Installation

#### For Ubuntu
```bash
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

## Environment Configuration

Set up your environment variables by copying and pasting these commands into your terminal:

## Starting the Executor

Once all configurations are set, start the executor:

```bash
./executor
```

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


## Verification (Optional)

To verify the executor is running correctly:
1. Check the terminal output for any error messages
2. Monitor the logs using the configured log level
3. Verify network connections to enabled networks

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
