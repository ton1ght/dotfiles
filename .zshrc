# get colors from wpg
# (cat $HOME/.config/wpg/sequences &)
cat ~/.config/wpg/sequences

###############################################################
# => exports
###############################################################

export TERM="xterm-256color"
export SUDO_EDITOR="/usr/bin/vim"
export LANG=en_US.UTF-8
export VISUAL=vim
export EDITOR=vim

###############################################################
# => zplug
###############################################################

source ~/.zplug/init.zsh
zplug romkatv/powerlevel10k, use:powerlevel10k.zsh-theme
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf", use:"shell/completion.zsh"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug load

###############################################################
# => Aliases
###############################################################
alias dualmon="xrandr --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-1 --off --output HDMI-1-1 --off --output DP-1-2 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-1-2 --off && i3-msg restart"
alias termreload="xrdb .Xresources"
alias info="pacman -Q --info"
alias grep="grep --color=auto"
alias packages="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias pm="sudo pacman -S"
alias ls="exa -l --group-directories-first"
alias ll="exa -al --group-directories-first"
alias removeorphans="sudo pacman -Rns $(pacman -Qtdq)"
alias polybarconfig="vim ~/.config/wpg/templates/polybar.base"
alias hirnlogin="~/bin/hirnlogin.sh"
alias vim="nvim"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias zshrc="vim ~/.zshrc"
alias rangerconfig="vim ~/.config/ranger/rc.conf"
alias ranger="~/bin/ranger.sh"
alias termite="~/bin/termite.sh"
alias vimrc="vim ~/.vimrc"
alias shconfig="vim .bashrc"
alias i3config="vim ~/.config/wpg/templates/i3.base"
alias termiteconfig="vim ~/.config/wpg/templates/config_termite_config.base"

###############################################################
# => Powerlevel10k
###############################################################

POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir_writable os_icon dir vcs) 
ZSH_THEME=powerlevel10k/powerlevel10k
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time vi_mode root_indicator)
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0BC'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0BA'

###############################################################
# => General
###############################################################

ZLE_RPROMPT_INDENT=0
autoload -U compinit
compinit -i
autoload colors
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END
setopt MENU_COMPLETE
setopt COMPLETE_ALIASES
setopt LIST_ROWS_FIRST
setopt globdots auto_cd auto_pushd
# Set/unset  shell options
#setopt   notify globdots correct pushdtohome cdablevars autolist
#setopt   autocd recexact longlistjobs
#setopt   autoresume histignoredups pushdsilent noclobber
#setopt   autopushd pushdminus extendedglob rcquotes mailwarning
#unsetopt bgnice autoparamslash

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

bindkey -v

ZSH_AUTOSUGGEST_STRATEGY=history

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward


# zsh suggestions keybindings
bindkey '^ ' autosuggest-accept

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Date Format
HIST_STAMPS="dd/mm/yyyy"


###############################################################
# => functions
###############################################################

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# fh - repeat history
runcmd (){ perl -e 'ioctl STDOUT, 0x5412, $_ for split //, <>' ; }

fh() {
  ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -re 's/^\s*[0-9]+\s*//' | runcmd
}

# fhe - repeat history edit
writecmd (){ perl -e 'ioctl STDOUT, 0x5412, $_ for split //, do{ chomp($_ = <>); $_ }' ; }

fhe() {
  ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -re 's/^\s*[0-9]+\s*//' | writecmd
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}