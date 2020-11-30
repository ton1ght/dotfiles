if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

###############################################################
# => exports
###############################################################

export TERM="alacritty"
export SUDO_EDITOR="/usr/bin/nvim"
export LANG=en_US.UTF-8
export VISUAL="nvim"
export EDITOR="nvim"
export PATH=$PATH:$HOME/bin

###############################################################
# => zplug
###############################################################

source ~/.zplug/init.zsh
zplug romkatv/powerlevel10k, use:powerlevel10k.zsh-theme
zplug "zsh-users/zsh-autosuggestions"
# zplug "softmoth/zsh-vim-mode"
# zplug "sindresorhus/pure"
zplug "zsh-users/zsh-completions"
zplug "junegunn/fzf", use:"shell/completion.zsh"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug load

###############################################################
# => Aliases
###############################################################
alias dualmon="xrandr --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-1 --off --output HDMI-1-1 --off --output DP-1-2 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI-1-2 --off && i3-msg restart"
alias termreload="xrdb .Xresources"
alias polybarreload="$HOME/.config/polybar/launch.sh"
alias info="pacman -Q --info"
alias grep="grep --color=auto"
alias packages="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias ls="exa --icons -l --group-directories-first"
alias ll="exa --icons -al --group-directories-first"
alias removeorphans="sudo pacman -Rns $(pacman -Qtdq)"
alias vim="nvim"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

###############################################################
# => Powerlevel10k
###############################################################

POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir_writable os_icon dir vcs) 
ZSH_THEME=powerlevel10k/powerlevel10k
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time vi_mode root_indicator)
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
# POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0BC'
# POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0BA'

###############################################################
# => General
###############################################################

# keychain saves ssh keys for one session
eval $(keychain --eval --quiet --confhost github)

ZLE_RPROMPT_INDENT=0
autoload -U compinit
compinit -i
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END
setopt MENU_COMPLETE
setopt hist_ignore_all_dups
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
bindkey '^R' history-incremental-search-backward
bindkey '^F' history-incremental-search-forward

# Search backwards and forwards with a pattern
#bindkey -M vicmd '/' history-incremental-pattern-search-backward
#bindkey -M vicmd '?' history-incremental-pattern-search-forward
#
## set up for insert mode too
#bindkey -M viins '^R' history-incremental-pattern-search-backward
#bindkey -M viins '^F' history-incremental-pattern-search-forward

ZSH_AUTOSUGGEST_STRATEGY=history

# place cursor at the end
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# bindkey "^[[A" history-beginning-search-backward-end
# bindkey "^[[B" history-beginning-search-forward-end
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

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

autoload -z edit-command-line 
zle -N edit-command-line
bindkey "^X^E" edit-command-line

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
