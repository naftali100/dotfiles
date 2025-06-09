## my dotfiles

### Requirements

- ripgrep
- fd
- neovim
- lua (for nvim)
- python
- dev packages 

### Usage
I  use [gnu stow](https://www.gnu.org/software/stow/) to symlink the files to home folder.

to use this repo, clone it and run this commands

```bash
cd dotfiles
stow {bash,zsh} // add packages you want to stow 
```

by default dotfiles will stow to `~` folder

you can change this in .stowrc file or by passing `--target` argument

### System Info
- OS: fedora
- global theme: [catppuccin](https://catppuccin.com/)
- shell: zsh
- shell theme: p10k
- zsh package manager: omz
- terminal emulator: Tilix
- editor: vscode
- launcher: ulauncher
- font: JetBrainsMono

### Icons

I use [nerd font icons](https://www.nerdfonts.com/)

to install nerd fonts, I use [getNf](https://github.com/ronniedroid/getnf)
