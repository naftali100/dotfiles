## my dotfiles

I  use [gnu stow](https://www.gnu.org/software/stow/) to symlink the files to home folder.

to use this repo, clone it and run this commands

```bash
cd dotfiles
stow {bash,zsh} // add packages you want to stow 
```

by default dotfiles will stow to `~` folder

you can change this in .stowrc file or by passing `--target` argument

### system
OS: fedora

shell: zsh

shell theme: p10k

zsh package manager: omz

terminal: Tilix

editor: vscode

launcher: ulauncher

font: JetBrainsMono

### icons

I use [nerd font icons](https://www.nerdfonts.com/)

to install nerd fonts, I use [getNf](https://github.com/ronniedroid/getnf)
