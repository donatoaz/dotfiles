
SLATE_CONFIG=.slate
ZSH_RC=.zshrc
GIT_CONFIG=.gitconfig
HYPER_CONFIG=.hyper.js
CTAGS_CONFIG=.ctags

link_with_backup () {
  if [ -f "$HOME/$1" ]; then
    if [ -h "$HOME/$1" ]; then
      echo "Unlinking $HOME/$1"
      unlink "$HOME/$1"
    else
      # it is a full fledged file so let's back it up
      echo "Backing up $HOME/$1"
      mv "$HOME/$1" "$HOME/$1.bkp"
    fi
  else
    echo "$HOME/$1 file does not exist"
  fi

  echo "Linking new $1 file"
  ln -s "$PWD/$1" "$HOME/$1"
}

link_with_backup_if_different () {
  if cmp -s "$PWD/$1" "$HOME/$1"; then
    echo "$1 is equal, skipping..."
  else
    echo "$1 is different, let's update it"
    link_with_backup $1
  fi
}

link_with_backup_if_different $SLATE_CONFIG
link_with_backup_if_different $ZSH_RC
link_with_backup_if_different $GIT_CONFIG
link_with_backup_if_different $HYPER_CONFIG
link_with_backup_if_different $CTAGS_CONFIG
