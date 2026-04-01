# Dotfiles

This is where I keep my dotfiles. The setup is intended to be portable across
all my devices, and manages the following:

- git
- zsh

## Getting Started

Clone this repo, then install [GNU Stow](https://www.gnu.org/software/stow/)
by downloading and building from source:

```shell
curl -O https://ftp.gnu.org/gnu/stow/stow-2.4.1.tar.gz
tar xzf stow-2.4.1.tar.gz
cd stow-2.4.1
./configure --prefix="$HOME/.local"
make install
cd ..
rm -rf stow-2.4.1 stow-2.4.1.tar.gz
```

Make sure `$HOME/.local/bin` is on your `PATH`, then run the following
command from the root of this repo to symlink the config into the right
places:

```shell
stow --target="$HOME" git zsh
```

# How To

TODO - simple instructions for how to do common things on this project

# Reference

## Symlink locations

The relationships between the files in this project and their targets on the
host machine are:

```
git/
  .gitconfig                    $HOME/.gitconfig

zsh/
  .zshrc                        $HOME/.zshrc
  .config/zsh/prompt/
    prompt_setup                $HOME/.config/zsh/prompt/prompt_setup
```

# Background

TODO - explain why this approach, and why these tools
