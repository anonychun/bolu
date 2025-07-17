# BOLU

Transform a fresh `Debian` installation into a fully-configured system by running a single command. There's no need to write bespoke configurations for every essential tool just to get started or to keep up with all the latest command-line tools. I use this script to streamline the bootstrapping of my own Linux box inside `Windows Subsystem for Linux (WSL)`.

Microsoft provides full instructions on setting up WSL at [WSL Install](https://learn.microsoft.com/en-us/windows/wsl/install).

Install Debian from PowerShell running as administrator:

```powershell
wsl --install -d Debian
```

After the installation, change the default shell to `zsh` because this script is designed to work with it. Additionally, you'll need `wget` for downloading the script.

```bash
sudo apt update
sudo apt install -y zsh wget
touch ~/.zshrc
chsh -s $(which zsh)
```

Open a new terminal and run the following command to download and execute the bootstrapping script:

```zsh
eval "$(wget -qO- https://raw.githubusercontent.com/anonychun/bolu/refs/heads/main/boot.sh)"
```
