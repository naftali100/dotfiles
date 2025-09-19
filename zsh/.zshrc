# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}

# Install Oh My Zsh if it doesn't exist
if [ ! -d "$ZSH" ]; then
  echo "Oh My Zsh not found, installing..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

## Init plugin list and clone if not exist before instant prompt

# Declare an associative array: plugin_name => git_repo_url
typeset -A OMZ_PLUGINS_TO_INSTALL=(
  [zsh-autosuggestions]="https://github.com/zsh-users/zsh-autosuggestions"
  # [zsh-completions]="https://github.com/zsh-users/zsh-completions"   # -> added below
  # [zsh-autocomplete]="https://github.com/marlonrichert/zsh-autocomplete"
  [ohmyzsh-full-autoupdate]="https://github.com/Pilaton/OhMyZsh-full-autoupdate"
  [you-should-use]="https://github.com/MichaelAquilina/zsh-you-should-use"
  # [colorize]="https://github.com/zpm-zsh/colorize"
  # [uutils-coreutils]="git@github.com:naftali100/uutils-coreutils-plugin.git"
  # [zsh-history-substring-search]="https://github.com/zsh-users/zsh-history-substring-search"
  # [zsh-fzf-history-search]="https://github.com/joshskidmore/zsh-fzf-history-search"
  [fzf-tab]="https://github.com/Aloxaf/fzf-tab"
  # [zsh-syntax-highlighting]="https://github.com/zsh-users/zsh-syntax-highlighting"
  [fast-syntax-highlighting]="https://github.com/zdharma-continuum/fast-syntax-highlighting"
)

# Loop through and install if missing
for plugin in "${(@k)OMZ_PLUGINS_TO_INSTALL}"; do
  plugin_dir="$ZSH_CUSTOM/plugins/$plugin"
  if [ ! -d "$plugin_dir" ]; then
    echo "Installing $plugin from ${OMZ_PLUGINS_TO_INSTALL[$plugin]}..."
    git clone "${OMZ_PLUGINS_TO_INSTALL[$plugin]}" "$plugin_dir"
  fi
done

# Ensure they're all in the plugins list
for plugin in "${(@k)OMZ_PLUGINS_TO_INSTALL}"; do
  if ! grep -q "$plugin" <<< "$plugins"; then
    plugins+=($plugin)
  fi
done


plugins+=(
  fzf 
  git-commit # add git commit with prefix
  git-auto-fetch 
  git
  git-escape-magic
  safe-paste
  ssh # hosts completion from config file
  dotenv
  python # auto activate venv
  zoxide # load zoxide
  golang
  kubectl # kubectl completion
  # command-not-found
)


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/.local/bin:$PATH


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="frisk"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 13   # update every 13 days

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# python plugin configs
PYTHON_VENV_NAME=".venv"
PYTHON_VENV_NAMES=($PYTHON_VENV_NAME venv)
PYTHON_AUTO_VRUN=true


# outside of the plugins normal loading as the readme suggest
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration

GIT_AUTO_FETCH_INTERVAL=3600 # in seconds
# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

#[[ -f ~/.inputrc ]] && bindkey ~/.inputrc
bindkey "^H" backward-kill-word

# my aliases
if [ -f ~/.shell_common ]; then
    . ~/.shell_common
fi

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi


#source .my-posh
#eval "$(oh-my-posh prompt init zsh --config ~/.poshthemes/my-theme.omp.json)"
#enable_poshtooltips

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# autoload -Uz url-quote-magic
# zle -N self-insert url-quote-magic

# autoload -U url-quote-magic bracketed-paste-magic
# zle -N self-insert url-quote-magic
# zle -N bracketed-paste bracketed-paste-magic


# pnpm end
