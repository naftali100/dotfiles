## my dotfiles

i  use gnu stow to symlink the files to home folder.
to use this repo

download it. and run this command

```bash
cd dotfiles
stow *
```

by default dotfiles will stow to `~` folder

you can change this in .stowrc file or by passing --target argument
