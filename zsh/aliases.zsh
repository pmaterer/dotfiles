if (( ${+commands[nvim]} )); then
  alias vim='nvim'
fi

if (( ${+commands[colordiff]} )); then
  alias diff='colordiff'
fi

if (( ${+commands[exa]} )); then
  alias ls='exa'
  alias ll='exa -l'
else
  alias ll='ls -l'
fi

if (( ${+commands[bat]} )); then
  alias cat='bat'
fi

alias dcu='docker compose up -d'
alias dcl='docker compose logs'
alias dclf='docker compose logs -f'
alias dcd='docker compose down'
alias dcr='docker compose rm'

alias here='pwd | pbcopy'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias reload!="source ${ZDOTDIR}/.zshrc"

alias list-plugins="ls -l $ZPLUGINDIR | awk '{print $7}'"

alias ctar="tar -czvf"
alias otar="tar -xvf"

alias listening='lsof -i -P | grep -i "listen"'

alias tfi='terraform init'
alias tfp='terraform plan -out=tfplan'
alias tfa='terraform apply tfplan'
alias tff='terraform fmt'

alias history-stats="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"

alias qi='qemu-img'
alias k='kubectl'
