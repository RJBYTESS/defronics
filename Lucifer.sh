#!/bin/bash

# Lucifer - Subdomain Enumeration & Screenshot Tool
# Author: You!

# Banner
echo "============================================"
echo "           🔥 L U C I F E R 🔥"
echo "   Automated Subdomain Enumeration Tool"
echo "============================================"

# Prompt for domain
read -p "Enter the domain name (e.g., example.com): " domain

# Create working directory
mkdir -p $domain
cd $domain

echo "[+] Running Subfinder..."
subfinder -d $domain -o sub.txt

echo "[+] Running Amass..."
amass enum -d $domain -o amass.txt

echo "[+] Running OneForAll..."
# Replace with your OneForAll path or alias
python3 /path/to/OneForAll/oneforall.py --target $domain run > ofa.txt

echo "[+] Running Chaos..."
chaos -d $domain -o chaos.txt

# Merge and deduplicate
echo "[+] Merging and deduplicating subdomains..."
cat sub.txt amass.txt ofa.txt chaos.txt | sort -u > Uniquesubdomains.txt

# Check which subdomains are alive
echo "[+] Checking alive subdomains with httpx..."
cat Uniquesubdomains.txt | httpx -silent > finalsubdomains.txt

# Take screenshots using EyeWitness
echo "[+] Taking screenshots with EyeWitness..."
EyeWitness -f finalsubdomains.txt --web --timeout 60 --no-prompt

echo "============================================"
echo " ✅ Lucifer has completed. "
echo " Check the EyeWitness report in the generated folder."
echo "============================================"
