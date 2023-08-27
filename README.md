## my dotfiles

I  use [gnu stow](https://www.gnu.org/software/stow/) to symlink the files to home folder.

to use this repo, clone it and run this commands

```bash
cd dotfiles
stow {bash,zsh} // add packages you want to stow 
```

by default dotfiles will stow to `~` folder

you can change this in .stowrc file or by passing --target argument
