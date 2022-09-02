# chvimenv
Change vim environment

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
This scirpt needs .vim-venvs directory

- 1.Make required directories.
```
mkdir -p .vim-venvs/vim-envionment-name/.vim
```

- 2.Copy your vimrc file.
```
cp  .vimrc .vim-venvs/vim-envionment-name/.vimrc
```
