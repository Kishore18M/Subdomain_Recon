#!/bin/bash

url=$1

# Check if the base directory exists, if not, create it
if [ ! -d "$url" ]; then
    mkdir "$url"
fi

# Check if the recon subdirectory exists, if not, create it
if [ ! -d "$url/recon" ]; then
    mkdir "$url/recon"
fi

echo "[+] Harvesting subdomains with assetfinder..."
assetfinder "$url" > "$url/recon/assets.txt"

# Filter and store only valid subdomains related to the target
grep "$url" "$url/recon/assets.txt" > "$url/recon/final.txt"

# Clean up temporary file
rm "$url/recon/assets.txt"

