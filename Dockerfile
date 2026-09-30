FROM node:22-bookworm-slim

LABEL org.opencontainers.image.title="claude-code-dev" \
      org.opencontainers.image.description="Docker image with Claude Code CLI and basic development utilities" \
      org.opencontainers.image.licenses="MIT"

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8 \
    LC_ALL=C.UTF-8 \
    NPM_CONFIG_LOGLEVEL=warn

RUN apt-get update && apt-get install -y --no-install-recommends \
        bash \
        bash-completion \
        ca-certificates \
        curl \
        git \
        gnupg \
        jq \
        less \
        locales \
        nano \
        openssh-client \
        procps \
        ripgrep \
        fzf \
        sudo \
        tree \
        unzip \
        zip \
        poppler-utils \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g @anthropic-ai/claude-code@latest \
    && npm cache clean --force

WORKDIR /app

ENV IS_SANDBOX=true \
    CLAUDE_CODE_DISABLE_UNKNOWN_MODEL_WINDOW_ENFORCEMENT=true \
    DISABLE_TELEMETRY=true \

USER root

ENTRYPOINT ["/usr/local/bin/claude"]

CMD ["--allow-dangerously-skip-permissions", "--dangerously-skip-permissions"]
