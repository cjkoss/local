#!/bin/sh

SCRIPT_DIR="$(cd "$(dirname "$0")" >/dev/null 2>&1; pwd)"
echo "SCRIPT_DIR=$SCRIPT_DIR"

NEW_HOME="$(cd "$SCRIPT_DIR/../.."; pwd)"
echo "NEW_HOME=$NEW_HOME"

DEFAULT_HOME="/Users/$USER"
echo "DEFAULT_HOME=$DEFAULT_HOME"

echo ' 
import = ["'$SCRIPT_DIR'/alacritty.toml",] 

[env] 
ZDOTDIR = "'$NEW_HOME'"

' > $DEFAULT_HOME/.config/alacritty/alacritty.toml

ln -sf $SCRIPT_DIR/tmux.conf $NEW_HOME/.tmux.conf
ln -sf $SCRIPT_DIR/zshrc $NEW_HOME/.zshrc

mkdir -p $NEW_HOME/.ssh
ln -sf $DEFAULT_HOME/.ssh/id_rsa_ck $NEW_HOME/.ssh/id_rsa
ln -sf $DEFAULT_HOME/.ssh/id_rsa_ck.pub $NEW_HOME/.ssh/id_rsa.pub
ln -sf $SCRIPT_DIR/gitconfig $NEW_HOME/.gitconfig
