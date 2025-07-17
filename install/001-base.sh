sudo apt install -y \
  mesa-utils \
  x11-utils \
  curl \
  wget \
  git \
  telnet \
  htop \
  vim \
  neovim \
  unzip \
  net-tools \
  jq \
  cloc \
  wrk \
  unzip \
  build-essential \
  pkg-config \
  autoconf \
  ca-certificates \
  openssl

mkdir -p ~/bin ~/src/github.com/anonychun

wget https://github.com/starship/starship/releases/latest/download/starship-$(uname -m)-unknown-linux-gnu.tar.gz -O /tmp/starship.tar.gz
tar -C /tmp -xzf /tmp/starship.tar.gz
mv /tmp/starship ~/bin

wget https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-$(dpkg --print-architecture).tar.gz -O /tmp/fastfetch.tar.gz
tar -C /tmp -xzf /tmp/fastfetch.tar.gz
mv /tmp/fastfetch-linux-$(dpkg --print-architecture)/usr/bin/fastfetch ~/bin
mv /tmp/fastfetch-linux-$(dpkg --print-architecture)/usr/bin/flashfetch ~/bin
