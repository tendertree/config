#!/bin/bash

# Update and initialize pacman keyring
sudo pacman-key --init
sudo pacman-key --populate archlinux

# Update system and install essential packages
sudo pacman -Sy
sudo pacman -S archlinux-keyring glibc base-devel git yarn zsh typescript nodejs python3 npm rustup go neovim unzip openssh ctags wget fzf cmake lldb zoxide tmux postgresql llvm helix

# Set up user and permissions
useradd -m -G wheel -s /bin/bash tree
echo "tree:password" | chpasswd  # Replace 'password' with your desired password

# Configure sudoers file
echo "%wheel ALL=(ALL) ALL" | sudo tee /etc/sudoers.d/wheel

# Set default user for WSL
Arch.exe config --default-user tree

# Configure Korean mirrorlist servers
echo -e "[core]\nServer = https://seoul.mirror.pkgbuild.com/\$repo/os/\$arch\n[extra]\nServer = https://seoul.mirror.pkgbuild.com/\$repo/os/\$arch" | sudo tee -a /etc/pacman.conf

# Update system again after setting mirrors
sudo pacman -Syuu

# Install reflector for faster mirror selection
sudo pacman -S reflector
sudo reflector -l 5 --sort rate --save /etc/pacman.d/mirrorlist

# Install yay for AUR package management
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay

# Install additional packages using yay
yay -S ripgrep pnpm luarocks ts-node

# Rust setup and additional installations via cargo
rustup default stable
cargo install zoxide --locked 
cargo install eza

# Install GUI components (optional)
yay -S xorg-apps xorg-server xfce4 noto-fonts-cjk

# Configure zsh as default shell and install oh-my-zsh with plugins
chsh -s /usr/bin/zsh tree
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Add plugins to .zshrc
echo "plugins=(zsh-syntax-highlighting zsh-autosuggestions)" >> ~/.zshrc

# Install and configure starship prompt for zsh
curl -sS https://starship.rs/install.sh | sh
echo 'eval "$(starship init zsh)"' >> ~/.zshrc

# Finalize setup by restarting the shell or system if necessary.
echo "Setup complete. Please restart your terminal."

