# Claude code container

Secure claude code docker image with disabled telimetry and useful agent tools

## Run

```shell
docker run \
    --rm -it \
    -u $(id -u):$(id -g) \
    -v ".:/app/$(pwd)" \ 
    -w "/app/$(pwd)" \
    -v "$HOME/.claude.json":/home/node/.claude.json \
    -v "$HOME/.claude":/home/node/.claude \
    --network=host \
    ghcr.io/poma4ka/claude-code:latest
```

## Run as alias

Add to ~/.bashrc

```shell
touch ~/.claude.json
alias claude='docker run --rm -it -u $(id -u):$(id -g) -v ".:/app/$(pwd)" -w "/app/$(pwd)" -v "$HOME/.claude.json":/home/node/.claude.json -v "$HOME/.claude":/home/node/.claude --network=host ghcr.io/poma4ka/claude-code:latest'
```

And use with:

```shell
user@Debian:~$ claude

# Or to continue working in exostong in project

user@Debian:~$ claude --continue
```