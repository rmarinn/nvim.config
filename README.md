# nvim.config

This is my personal neovim config which I use on my windows machine. I mostly made this repo to help me reinstall this thing again.

- *Install chocolatey so you can easily install the other dependencies*

## Where should I put init.lua?
Use `:h rtp` to find the paths that neovim will search for files. It usually defaults to `User/Appdata/Local/nvim` and `User/Appdata/Local/nvim` but you can set `XDG_CONFIG_HOME` somewhere else in the environment variables.


## Treesitter wont install properly
1. First install choco
2. `choco install llvm`
3. make sure the compiler for treesitter is `clang`
4. for more info: [treesitter windows support](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support)

## Working with c#
Use [omnisharp-roslyn](https://github.com/OmniSharp/omnisharp-roslyn) as the LSP.
1. Install the language server: `choco install omnisharp`
2. Add omnisharp.exe to the path variables. (it can usually be found at `C:\ProgramData\chocolatey\lib\omnisharp` when installed with choco
