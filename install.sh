#!/bin/sh

# Function to check if zsh is installed
check_zsh() {
    if ! command -v zsh >/dev/null 2>&1; then
        echo "Zsh is not installed. Please install zsh to proceed."
        exit 1
    fi
}

# Function to install the custom theme
install_theme() {
    # Copy the theme to the oh-my-zsh themes directory
    if [ ! -d ~/.oh-my-zsh/themes ]; then
        echo "Oh My Zsh is not installed. Please install Oh My Zsh to proceed."
        exit 1
    fi

    cp agnosterk.zsh-theme ~/.oh-my-zsh/themes/

    # Update .zshrc to use the new theme
    if grep -q "ZSH_THEME=" ~/.zshrc; then
        sed -i 's/^ZSH_THEME=".*"/ZSH_THEME="agnosterk"/' ~/.zshrc
    else
        echo 'ZSH_THEME="agnosterk"' >> ~/.zshrc
    fi

    echo "Custom agnosterk theme installed and .zshrc updated!"
}

# Check if zsh is installed
check_zsh

# Install the custom theme
install_theme
