export NAN_SOURCE="${NAN_SOURCE} -> shell/aliases.sh"

# ----------------------------------------------------------------------------
# safeguarding
# @see {@link https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md#safeguard-rm}
# ----------------------------------------------------------------------------

alias rm='rm -i'

# ----------------------------------------------------------------------------
# paths and dirs
# ----------------------------------------------------------------------------

alias ..='cd -- ..'
alias ....='cd -- ../..'
alias dirs='dirs -v' # default to vert, use -l for list
alias down='cd -- "${XDG_DOWNLOAD_DIR}"'
alias downs='down'

# ----------------------------------------------------------------------------
# editors
# ----------------------------------------------------------------------------

alias e="$EDITOR"
alias c="code"

# ----------------------------------------------------------------------------
# languages
# ----------------------------------------------------------------------------

alias py2="python2"
alias py3="python3"

# ----------------------------------------------------------------------------
# sudo ops
# ----------------------------------------------------------------------------

alias mine='sudo chown -R "$USER"'
alias root='sudo -s'
alias se='sudo -e'

# ----------------------------------------------------------------------------
# miscellaneous/experimentation
# ----------------------------------------------------------------------------

alias ls="exa"
alias la="ls -a"
alias ll="ls -l"
alias lt="ls -l -T"
alias lg="ls -l -G"
alias l="ls -alG"

alias tmux='tmux -f "${DOTFILES}/tmux/tmux.conf"'