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

## Working with c#

Use [omnisharp](https://www.omnisharp.net/) as the LSP.
1. Install the language server: `scoop install omnisharp`
2. scoop should automatically add omnisharp to the path. restart the terminal and run `omnisharp -h` to check.

## Nerdfont Installation

1. Download [Mononoki Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Mononoki)
2. In Powershell, go to `Settings > Defaults > Fontface` and set the font there
3. Click Save
4. Set the font in `./lua/config/options.lua`

You can find other fonts [here](https://github.com/ryanoasis/nerd-fonts#patched-fonts).

