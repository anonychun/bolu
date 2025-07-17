sudo apt update
sudo apt upgrade -y
sudo apt install -y git

rm -rf ~/.local/share/bolu
git clone https://github.com/anonychun/bolu.git ~/.local/share/bolu

echo -e "\nInstallation starting..."
source ~/.local/share/bolu/install.sh

sudo apt autoremove -y
sudo apt autoclean -y
