wget https://go.dev/dl/$(curl -s 'https://go.dev/dl/?mode=json' | jq -r '.[0].version').linux-$(dpkg --print-architecture).tar.gz -O /tmp/go.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf /tmp/go.tar.gz

cat >> ~/.zshrc << "EOF"

# Go
export PATH=$PATH:/usr/local/go/bin
export GOBIN=$(go env GOPATH)/bin
export PATH=$PATH:$GOBIN
EOF
