#!/bin/bash
sudo rm /home/codespace/.vscode-remote/bin/*/server.sh
sudo chmod 777 ./server.sh
sudo cp ./server.sh /home/codespace/.vscode-remote/bin/*/server.sh