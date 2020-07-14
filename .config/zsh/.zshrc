# Enable colors and change prompt:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Shared history in cache directory:
HISTSIZE=10000
SAVEHIST=10000
export HISTFILE=~/.cache/zsh/zhist
setopt SHARE_HISTORY
unsetopt no_share_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# alt dot
bindkey "^[." insert-last-word
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect 'j' vi-down-line-or-history

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# Path sync

PATH="$PATH:$HOME/.local/share/"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/gala/.installs/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/gala/.installs/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/gala/.installs/miniconda3/etc/profile.d/conda.sh"
    else
        PATH="/home/gala/.installs/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=[fg=magenta, bg=white] #not working, look@later
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^ ' autosuggest-accept

# # # NOTES # # #

export NOTES=hahahaha
