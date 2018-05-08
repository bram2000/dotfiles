#!/bin/bash -ex

if [ $(pyenv versions | grep '[^/]neovim2' | wc -l) -eq 1 ]; then
  echo "neovim2 version already exists, not recreating"
else
  # Install latest 2.*
  LATEST_2=$(pyenv install --list | grep -v - | grep -v b | grep -v rc | grep '^[       ]*2' | tail -1)
  pyenv install $LATEST_2
  pyenv virtualenv $LATEST_2 neovim2
  pyenv shell neovim2
  pip install neovim
  echo "neovim2 env installed"
  pyenv shell --unset
fi

if [ $(pyenv versions | grep '[^/]neovim3' | wc -l) -eq 1 ]; then
  echo "neovim3 version already exists, not recreating"
else
  # Install latest 3.*
  LATEST_3=$(pyenv install --list | grep -v - | grep -v b | grep -v rc | grep '^[       ]*3' | tail -1)
  pyenv install $LATEST_3
  pyenv virtualenv $LATEST_3 neovim3
  pyenv shell neovim3
  pip install neovim
  echo "neovim3 env installed"
  pyenv shell --unset
fi

echo "complete"
