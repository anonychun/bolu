sudo apt install -y \
  ca-certificates \
  dpkg-dev \
  libgdbm-dev \
  autoconf \
  bzip2 \
  g++ \
  gcc \
  libbz2-dev \
  libffi-dev \
  libgdbm-compat-dev \
  libglib2.0-dev \
  libgmp-dev \
  libncurses-dev \
  libssl-dev \
  libxml2-dev \
  libxslt-dev \
  libyaml-dev \
  make \
  wget \
  xz-utils \
  zlib1g-dev \
  sqlite3 \
  libsqlite3-dev \
  default-libmysqlclient-dev \
  libpq-dev \
  imagemagick \
  ffmpeg \
  libxml2-dev \
  libvips \
  libffi-dev \
  build-essential \
  pkg-config \
  bison \
  git \
  libreadline-dev \
  tzdata

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
~/.rbenv/bin/rbenv init
source ~/.zprofile

git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

rbenv install $(rbenv install -l | grep -v - | tail -1)
rbenv global $(rbenv install -l | grep -v - | tail -1)

gem install rails foreman ruby-lsp standard

cat >> ~/.zshrc << "EOF"

# Ruby
export RUBY_YJIT_ENABLE="1"
export SECRET_KEY_BASE_DUMMY="1"

alias r="./bin/rails"
alias rc="./bin/rails console"
alias rr="./bin/dev"
EOF
