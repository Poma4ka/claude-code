FROM node:26-trixie-slim

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
        wget \
        git \
        gnupg \
        jq \
        bc \
        less \
        locales \
        nano \
        openssh-client \
        procps \
        ripgrep \
        fzf \
        sudo \
        tree \
        tar \
        unzip \
        zip \
        poppler-utils \
        bind9-dnsutils \
        mtr \
        tcpdump \
        nmap \
        libreoffice \
        fonts-noto \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g npm@11.21.2

RUN npm install -g @anthropic-ai/claude-code@latest \
    && npm cache clean --force

WORKDIR /app

ENV IS_SANDBOX=1 \
    CLAUDE_CODE_DISABLE_UNKNOWN_MODEL_WINDOW_ENFORCEMENT=true \
    DISABLE_TELEMETRY=true \
    NPM_CONFIG_UPDATE_NOTIFIER=false

USER root

ENTRYPOINT ["/usr/local/bin/claude"]

CMD ["--allow-dangerously-skip-permissions", "--dangerously-skip-permissions"]
