#!/bin/bash

echo "=========================================="
echo "        ⚙️  Lucifer Setup Script"
echo "=========================================="

echo "[+] Updating system..."
sudo apt update -y && sudo apt upgrade -y

echo "[+] Installing dependencies..."
sudo apt install -y git python3 python3-pip golang eyewitness

# Install Subfinder
echo "[+] Installing Subfinder..."
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Install Amass
echo "[+] Installing Amass..."
sudo snap install amass

# Install httpx
echo "[+] Installing httpx..."
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

# Install Chaos Client
echo "[+] Installing Chaos..."
go install -v github.com/projectdiscovery/chaos-client/cmd/chaos@latest

# Install OneForAll
echo "[+] Installing OneForAll..."
git clone https://github.com/shmilylty/OneForAll.git
cd OneForAll
pip install -r requirements.txt
cd ..

echo "[+] Verifying installations..."
echo "Subfinder: $(which subfinder)"
echo "Amass: $(which amass)"
echo "httpx: $(which httpx)"
echo "Chaos: $(which chaos)"
echo "EyeWitness: $(which EyeWitness)"

echo "=========================================="
echo " ✅ All tools installed!"
echo " Please ensure Go's bin directory is in your PATH:"
echo " export PATH=\$PATH:\$HOME/go/bin"
echo "=========================================="
