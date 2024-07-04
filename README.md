# nvim.config

This is my personal neovim config which I use on my windows machine. I mostly made this repo to help me reinstall this thing again.

## Where should I put init.lua?
Use `:h rtp` to find the paths that neovim will search for files. It usually defaults to `User/Appdata/Local/nvim` and `User/Appdata/Local/nvim` but you can set `XDG_CONFIG_HOME` somewhere else in the environment variables.

## Treesitter wont install properly
1. First install choco
2. `choco install llvm`
3. make sure the compiler for treesitter is `clang`
4. for more info: [treesitter windows support](https://github.com/nvim-treesitter/nvim-treesitter/wiki/Windows-support)

## Installing csharp language server
> dotnet tool install --global csharp-ls
