#!/bin/bash

download_url="https://github.com/shiftkey/desktop/releases/download/release-3.2.7-linux2/GitHubDesktop-linux-amd64-3.2.7-linux2.deb"

echo "GitHub Desktop .deb file download and install script"
echo "Download URL: $download_url"
echo ""

echo "Please provide the path where you want to save the downloaded file:"
read -e download_path

if [ ! -d "$download_path" ]; then
  echo "Error: The specified directory does not exist."
  exit 1
fi

deb_filename="GitHubDesktop-linux-amd64-3.2.7-linux2.deb"
deb_path="$download_path/$deb_filename"

echo "Downloading GitHub Desktop .deb file..."
wget -P "$download_path" "$download_url"

echo "Download complete! The file has been saved to: $deb_path"

echo "Installing GitHub Desktop..."
sudo apt-get install gdebi-core -y
sudo gdebi "$deb_path"
echo "Installation complete!"

exit 0
