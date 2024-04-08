#!/bin/bash

CONFIG_DIR="$HOME/.config/Code/User/"

echo "Restoring VSCode settings and keybindings..."


if [ -d "$CONFIG_DIR" ]; then

    cp settings.json "$CONFIG_DIR"
    cp keybindings.json "$CONFIG_DIR"
    echo "Settings and keybindings restored."
else
    echo "VSCode configuration directory does not exist. Please ensure VSCode is installed."
    exit 1
fi

echo "Installing extensions..."

# install each extension mannually
while IFS= read -r extension
do
    code --install-extension "$extension"
done < extensions.list

echo "All extensions have been installed."
