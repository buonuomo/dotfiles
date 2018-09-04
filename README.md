## Dotfiles ##

These are my core dotfiles for my command line setup

### Installation ###

Simply clone this repository and run the setup script
```
git clone https://github.com/buonuomo/dotfiles
./dotfiles/scripts/setup.sh
```
The setup script will create symlinks to each of the
config files in the `scripts/config` folder in the 
locations specified by the `bash.csv` or `zsh.csv`
files.

Also note that the script will prompt before replacing
any preexisting configuration files with symlinks
