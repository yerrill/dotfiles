#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -lh --color=auto'
alias grep='rg --color=auto'
alias df='df -h --total'
alias dfh='df -h --total /dev/sdb3 /dev/sda1'
alias garb='find . -type d \( -name "target" -o -name "venv" -o -name "node_modules" \)'
alias lg='eval "$(ssh-agent)"; ssh-add /home/zach/.ssh/id_ed25519; lazygit; eval "$(ssh-agent -k)";'
alias claude='sbx run claude'

# PS1='[\u@\h \W]\$ '
PS1='\u -> \W \!:\# \$ '
