# chvimenv
Change vim environment with symblic links.

```
chvimenv - Change vim environment with symblic links.

  Arguments:
    $1: vim_environment_name
          - Vim environment directory witch has a .vim directory and a .vimrc file.
              ~/.vim-venvs/vim_environment_name/.vim
              ~/.vim-venvs/vim_environment_name/.vimrc
  Usage:
    chvimenv vim_environment_name
```

## Installation
Run the bellow command to install.
```
cd chvimenv
sudo cp ./chvimenv.sh /usr/local/bin/chvimenv
sudo chmod +rx /usr/local/bin/chvimenv
```

## Usage
```
chvimenv vim-envionment-name
```

### Preparation
This scirpt needs .vim-venvs directory.

- Make required directories.
```
mkdir -p .vim-venvs/vim-envionment-name/.vim
```

- Copy your vimrc file.
```
cp  .vimrc .vim-venvs/vim-envionment-name/.vimrc
```
