# Executor Release

### Download the latest version of [Executor Binary](https://github.com/t3rn/executor-release/releases/)

### Follow the [Setup Guide](https://docs.t3rn.io/executor/become-an-executor/binary-setup) in our technical documentation

## Docker Setup
1. clone/download repository and save it to new folder/directory
2. change the environtment variables inside `compose.yml` file
3. run `docker compose up -d`

### upgrade guide
1. open Dockerfile and change to the latest version
2. run `docker compose up -d`, this will automatically rebuild image and run recreate the instance
