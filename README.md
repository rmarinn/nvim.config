# nvim.config (WSL Ubuntu)

This is my personal neovim config which I use on my windows machine.
*I mostly made this repo to help me reinstall this thing again.*

## Updating WSL

on a fresh install, you probably need to update Ubuntu.

```sh
sudo apt update
sudo apt upgrade
```

## Dependencies

Install the following dependencies required for this setup:

```sh
sudo apt install git make unzip gcc ripgrep
```

## Where should I put init.lua?

Use `:h rtp` to find the paths that neovim will search for files. It usually defaults to `~/.config/nvim/`.

## LSP Setup

to install aditionall lsps manually, use `:LspInstall`.

Mason will let you choose lsps available for the currently open file

## Nerdfont Installation

1. Download [Mononoki Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Mononoki)
2. In Powershell, go to `Settings > Defaults > Fontface` and set the font there
3. Click Save
4. Set the font in `./lua/config/options.lua`

You can find other fonts [here](https://github.com/ryanoasis/nerd-fonts#patched-fonts).

## Making Alacritty run WSL on stratup

put this on your `~/appdata/roaming/alacritty/alacritty.toml` (on your windows home directory):

```toml
[general]
working_directory = "//wsl$/Ubuntu/home/rmarinn"

[window]
startup_mode = "Maximized"

[font]
normal = { family = "Mononoki Nerd Font Mono" }
size = 14  # Font size

[terminal]
shell = { program = "wsl", args = ["-d", "Ubuntu"] }
```

## Setting up Git

First setup your username and email:

```sh
git config --global user.name "Your Name"
git config --global user.email "youremail@domain.com"
```

Then setup the credential manager:

```sh
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"
```

## Signing Commits

To sign commits, see the relevant docs:

- [Generating a new GPG key](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key?platform=linux).
- [Telling Git about your signing key](https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key)
- [Adding a GPG key to your GitHub account](https://docs.github.com/en/authentication/managing-commit-signature-verification/adding-a-gpg-key-to-your-github-account)

### Fixing `No pinentry` Error

1. First install [gpg4win](https://www.gpg4win.org/). We will use this as the graphical interface where we can enter our passphrase.

2. Then, install the signing packages if you don't have them yet.

```sh
sudo apt-get install gpg gnupg gpg-agent
```

3. Edit the gnupg config at `~/.gnupg/gpg-agent.conf`. If the file does not exist, create it.

```conf
default-cache-ttl 34560000
max-cache-ttl 34560000
pinentry-program "/mnt/c/Program Files (x86)/GnuPG/bin/pinentry-basic.exe"
```

- We set the `default-cache-ttl` and `max-cache-ttl` to 400 days so we dont have to keep entering the passphrase until we restart (Optional).
- Then we point to the graphical pinentry program

4. Done.
