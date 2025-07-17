for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done

sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update

sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd -f docker
sudo usermod -aG docker $USER

sudo systemctl enable docker.socket
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

mkdir -p ~/container

cat >> ~/container/docker-compose.yml << "EOF"
services:
  postgres:
    image: docker.io/library/postgres:17.5
    container_name: postgres
    restart: unless-stopped
    ports:
      - 5432:5432
    environment:
      - POSTGRES_USER=anonychun
      - POSTGRES_PASSWORD=Secret00
    volumes:
      - postgres-data:/var/lib/postgresql/data

  mysql:
    image: docker.io/library/mysql:8.4.5
    container_name: mysql
    restart: unless-stopped
    ports:
      - 3306:3306
    environment:
      - MYSQL_USER=anonychun
      - MYSQL_PASSWORD=Secret00
      - MYSQL_ROOT_PASSWORD=Secret00
    volumes:
      - mysql-data:/var/lib/mysql

  redis:
    image: docker.io/library/redis:8.0.3
    container_name: redis
    privileged: true
    restart: unless-stopped
    ports:
      - 6379:6379
    ulimits:
      memlock: -1
    volumes:
      - redis-data:/data

  minio:
    image: quay.io/minio/minio:RELEASE.2025-06-13T11-33-47Z
    container_name: minio
    restart: unless-stopped
    command: server /data --console-address ":9001"
    ports:
      - 9000:9000
      - 9001:9001
    environment:
      - MINIO_ROOT_USER=anonychun
      - MINIO_ROOT_PASSWORD=Secret00
    volumes:
      - minio-data:/data

volumes:
  postgres-data:
    external: true
  mysql-data:
    external: true
  redis-data:
    external: true
  minio-data:
    external: true
EOF

sudo docker volume create postgres-data
sudo docker volume create mysql-data
sudo docker volume create redis-data
sudo docker volume create minio-data

sudo docker compose -f ~/container/docker-compose.yml up -d

cat >> ~/.zshrc << "EOF"

# Docker
alias psql="docker exec -it postgres psql"
alias mysql="docker exec -it mysql mysql"
alias redis-cli="docker exec -it redis redis-cli"
EOF
