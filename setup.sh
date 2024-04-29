#!/usr/bin/env sh

# All .config
ln -s $PWD/bspwm-related/bspwm $HOME/.config/bspwm 
ln -s $PWD/bspwm-related/sxhkd $HOME/.config/sxhkd 
ln -s $PWD/fontconfig $HOME/.config/fontconfig
ln -s $PWD/kitty-related $HOME/.config/kitty
ln -s $PWD/picom $HOME/.config/picom
ln -s $PWD/rofi-related $HOME/.config/rofi 
ln -s $PWD/packer.nvim $HOME/.cache/nvim/

# Shell config
ln -sf $PWD/zsh-related/.zshrc $HOME/.zshrc
ln -sf $PWD/zsh-related/.xinitrc $HOME/.xinitrc
ln -sf $PWD/zsh-related/simple.zsh-theme $HOME/.oh-my-zsh/themes/simple.zsh-theme

# Custom scripts config
ln -s $PWD/myscripts $HOME/.local/bin/myscripts
ln -s $PWD/custom-themes $HOME/.local/custom-themes
