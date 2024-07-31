# nvim.config

This is my personal neovim config which I use on my windows machine.
*I mostly made this repo to help me reinstall this thing again.*

## Dependencies

install scoop to handle the easily dependencies:
```
winget install scoop
```
then install neovim and the dependencies
```
scoop install neovim
scoop install git
scoop install ripgrep
scoop install gcc
```
make sure to restart as well since since tree sitter since it bugs out sometimes: [treesitter windows support](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support#troubleshooting)

## Where should I put init.lua?

Use `:h rtp` to find the paths that neovim will search for files. It usually defaults to `User/Appdata/Local/nvim` and `User/Appdata/Local/nvim` but you can set `XDG_CONFIG_HOME` somewhere else in the environment variables.

## LSP Setup

to install lsps, use `:LspInstall`.

Mason will let you choose lsps available for the currently open file

## Nerdfont Installation

1. Download [Mononoki Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Mononoki)
2. In Powershell, go to `Settings > Defaults > Fontface` and set the font there
3. Click Save
4. Set the font in `./lua/config/options.lua`

You can find other fonts [here](https://github.com/ryanoasis/nerd-fonts#patched-fonts).

## Installing auto formatters for [conform](https://github.com/stevearc/conform.nvim) to use
- [htmlbeautifier](https://github.com/threedaymonk/htmlbeautifier): `gem install htmlbeautifier`
- [csharpier](https://github.com/belav/csharpier): `dotnet tool install csharpier -g`
