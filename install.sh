#!/usr/bin/zsh
pushd $DOTFILES
stow -D alacritty i3 nvim picom polybar zsh rofi
stow alacritty i3 nvim picom polybar zsh rofi
popd

