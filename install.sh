#!/usr/bin/zsh
pushd $DOTFILES
stow -D alacritty i3 nvim picom polybar zsh
stow alacritty i3 nvim picom polybar zsh
popd

