FROM ubuntu:24.04

RUN apt-get update

RUN apt-get install -y --no-install-recommends \
    curl \
    git \
    ca-certificates \
    ripgrep \
    gcc \
    libc-dev

RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && \
    chmod u+x nvim.appimage && \
    ./nvim.appimage --appimage-extract && \
    ln -s /squashfs-root/AppRun /usr/bin/nvim

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > rustup && \
    sh rustup -y && \
    export PATH="$HOME/.cargo/bin:$PATH"



