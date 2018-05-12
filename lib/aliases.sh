export NAN_SOURCE="${NAN_SOURCE} -> lib/aliases.sh"

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