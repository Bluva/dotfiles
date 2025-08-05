#
# ~/.bashrc
#
source /usr/share/git/completion/git-prompt.sh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


set_bash_prompt() {
    local GREEN="\[\e[0;32m\]"
    local CYAN="\[\e[0;36m\]"
    local RESET="\[\e[0m\]"

    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWUNTRACKEDFILES=1
    export GIT_PS1_SHOWUPSTREAM=auto

    export PS1="${GREEN}\w ${CYAN}\$(__git_ps1 ' (%s)')${RESET} \$ "
}
set_bash_prompt

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '
#PS1='\w \$ '
alias i3cfg='nvim ~/.config/i3/config'
alias statuscfg='nvim ~/.i3status.conf'
alias wifi='nmtui'
alias polybarcfg='nvim ~/.config/polybar/config.ini'
alias nvimcfg='nvim ~/.config/nvim/init.vim'

alias start-venv='source venv/bin/activate'
alias start-vm='sudo systemctl start libvirtd.service && sudo systemctl start vmware-networks.service'
alias mirrordisplay='xrandr --output DP-1 --mode 1920x1080 --same-as eDP-1'



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


#Smart find
ffind() {
    local file dir mimetype
    file=$(fd . ~ 2>/dev/null | fzf) || return
    dir=$(dirname "$file")
    mimetype=$(file --mime-type -b "$file")


    if [[ -d "$file" ]]; then
        cd "$file" || return
        return
    fi

    case "$mimetype" in
        image/*|video/*|application/pdf)
            nohup xdg-open "$file" >/dev/null 2>&1 &
            disown
            exit 0
            ;;
        *)
            cd "$dir" || return
            nvim "$file"
            ;;
    esac
}
