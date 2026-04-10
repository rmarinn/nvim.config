# nvim.config

## Dependencies

install scoop to handle the easily dependencies:
```
winget install scoop
```
then install neovim and the dependencies
```
scoop install ripgrep
scoop install git
scoop install gcc
scoop install neovim
```

## Where should I put init.lua?

Use `:h rtp` to find the paths that neovim will search for files.

## Nerdfont Installation

1. Download [Mononoki Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Mononoki)
2. In Powershell, go to `Settings > Defaults > Fontface` and set the font there
3. Click Save
4. Set the font in `./lua/config/options.lua`

You can find other fonts [here](https://github.com/ryanoasis/nerd-fonts#patched-fonts).

## Clipboard integration in WSL

Install `win32yank` on windows and it should make itself available on WSL

```
scoop install win32yank
```

