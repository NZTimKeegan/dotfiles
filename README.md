# Dotfiles

This is where I keep my dotfiles. The setup is intended to be portable across
all my devices, and manages the following:

- alacritty
- claude
- git
- nvim (see [nvim/README.md](nvim/README.md))
- zellij
- zsh

## Getting Started

### Prerequisites

#### Alacritty

Install from the [releases page](https://github.com/alacritty/alacritty/releases).

#### Font

Download and install [Iosevka Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Iosevka.zip)

#### Git

Create `~/.gitconfig.local` with your email address for this device:

```
[user]
    email = you@example.com
```

#### Neovim

Install from the [releases page](https://github.com/neovim/neovim/releases).

#### Path

Make sure `$HOME/.local/bin` is on your `PATH`.

#### Treesitter

Install from the [releases page](https://github.com/tree-sitter/tree-sitter/releases).

#### Stow

Install [GNU Stow](https://www.gnu.org/software/stow/) by downloading and
building from source:

```shell
curl -O https://ftp.gnu.org/gnu/stow/stow-2.4.1.tar.gz
tar xzf stow-2.4.1.tar.gz
cd stow-2.4.1
./configure --prefix="$HOME/.local"
make install
cd ..
rm -rf stow-2.4.1 stow-2.4.1.tar.gz
```

#### Zellij

Install from the [releases page](https://github.com/zellij-org/zellij/releases).

### Symlinking config

Run the following command from the root of this repo to symlink the config
into the right places:

```shell
stow --target="$HOME" alacritty claude git nvim zellij zsh
```

# How To

## Adding new config

1. Create a top-level directory for the tool (e.g. `mytool/`)
2. Inside it, mirror the path where the config should live relative to `$HOME`.
   For example, if the config belongs at `~/.config/mytool/config.toml`, create
   `mytool/.config/mytool/config.toml`
3. Add the new directory name to the `stow` command and re-run it:

```shell
stow --target="$HOME" alacritty claude git mytool nvim zellij zsh
```

Stow will create a symlink from `$HOME/.config/mytool/config.toml` to the file in
this repo.

# Reference

## Symlink locations

The relationships between the files in this project and their targets on the
host machine are:

```
alacritty/
  .config/alacritty/
    alacritty.toml              $HOME/.config/alacritty/alacritty.toml
    dracula.toml                $HOME/.config/alacritty/dracula.toml

claude/
  .claude/
    settings.json               $HOME/.claude/settings.json
    statusline-command.sh       $HOME/.claude/statusline-command.sh

git/
  .gitconfig                    $HOME/.gitconfig

nvim/
  .config/nvim/                 $HOME/.config/nvim/

zellij/
  .config/zellij/
    config.kdl                  $HOME/.config/zellij/config.kdl

zsh/
  .zshrc                        $HOME/.zshrc
  .config/zsh/prompt/
    prompt_setup                $HOME/.config/zsh/prompt/prompt_setup
```

# Background

TODO - explain why this approach, and why these tools
