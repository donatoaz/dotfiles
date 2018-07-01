
SLATE_CONFIG=$HOME/.slate
ZSH_RC=$HOME/.zshrc
GIT_CONFIG=$HOME/.gitconfig

link_with_backup () {
  if [ -f $1 ]; then
    if [ -h $1 ]; then
      echo "Unlinking $1"
      unlink $1
    else
      echo "Backing up $1"
      mv $1 $1.bkp
    fi
  else
    echo "$1 file does not exist"
  fi

  echo "Linking new $(basename $1) file"
  ln -s $PWD/.slate $1
}

link_with_backup $SLATE_CONFIG
#link_with_backup $ZSH_RC
#link_with_backup $GIT_CONFIG
