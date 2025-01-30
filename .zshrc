### ZSH CONFIG ###
# Load extension
autoload -Uz compinit promptinit
compinit
promptinit
# Set default prompt
prompt adam1
# Autocomplete settings
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zstyle :compinstall filename '/home/aaron/.zshrc'
# History settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# Editor settings
bindkey -v

### SSH-AGENT ###
if [ -z "$SSH_AUTH_SOCK" ]; then
  # Check for a currently running instance of the agent
  RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
  if [ "$RUNNING_AGENT" = "0" ]; then
    # Launch a new instance of the agent
    ssh-agent -s &> $HOME/.ssh/ssh-agent
  fi
  eval `cat $HOME/.ssh/ssh-agent`
fi

### PYENV SETUP ###
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

### BUN ###
# bun completions
[ -s "/home/aaron/.bun/_bun" ] && source "/home/aaron/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

### ZOXIDE ###
eval "$(zoxide init zsh)"

### ALIASES ###
alias refresh="source ~/.zshrc"
alias l="lsd -lh"
alias la="lsd -lah"
alias lt="lsd --tree"
alias lta="lsd --tree -a"
alias cd="z"
alias grep="grep --color=auto"
