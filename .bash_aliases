alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ll='ls -lh'
alias la='ls -la'
alias l='ls -CF'

alias mkdir='mkdir -pv'
alias rmd='rm -r'

alias cpv='rsync -ah --progress' # Copy with progress
alias mvv='mv -v'                # Move with verbose
alias rmv='rm -v'                # Remove with verbose

alias ip='ip a'
alias ports='netstat -tulnp'
alias pingg='ping google.com'

alias sshconfig='vim ~/.ssh/config'
alias sshkeygen='ssh-keygen -t rsa -b 4096'
alias fauxigent='ssh fauxigent'
alias deployio='ssh deployio'

alias myip='curl ifconfig.me'

alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'
alias gpo='git push origin'
alias gf='git fetch'
alias gpm='git push origin main'
alias gpull='git pull'
alias gpullo='git pull origin'
alias gpullm='git pull origin main'
alias glog='git log --oneline --graph --all'
alias gco='git checkout'
alias gcom='git checkout main'
alias gm='git merge'
alias gmo='git merge origin'

alias dps='docker ps'
alias dpa='docker ps -a'
alias dstop='docker stop $(docker ps -q)'
alias drm='docker rm $(docker ps -aq)'
alias dlogs='docker logs'
alias dexec='docker exec -it'
alias dcom='docker-compose'
alias dcomup='dcom up'
alias dcomdn='dcom down'
alias dcomb='dcom build'

alias c='clear'
alias h='history'
alias path='echo $PATH | tr ":" "\n"'
alias ealiases='vim ~/.bashrc' # Edit aliases quickly
alias saliases='source ~/.bashrc' # Reload aliases
alias grep='grep --color=auto'
alias df='df -h'
alias free='free -m'

alias update='sudo apt update && sudo apt upgrade -y'
alias install='sudo apt install'
alias remove='sudo apt remove'
alias cleanup='sudo apt autoremove && sudo apt autoclean'
alias reboot='sudo reboot'
alias shutdown='sudo shutdown now'

alias cdngxconf='cd /etc/nginx/'
alias pm2ls='pm2 list'

alias nrd='npm run dev'
alias nrc='npm run client'
alias nrs='npm run server'

export PATH="/c/Users/vasud/anaconda3/bin:$PATH"
export PATH="/c/Users/vasud/anaconda3/condabin:$PATH"
