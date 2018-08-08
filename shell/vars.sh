export NAN_SOURCE="${NAN_SOURCE} -> shell/vars.sh"

# ============================================================================
# Locale
# ============================================================================

export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# ============================================================================
# Dotfile paths
# ============================================================================

export DOTFILES="${HOME}/.dotfiles"
export VDOTDIR="${DOTFILES}/vim"
export ZDOTDIR="${DOTFILES}/zsh"

# ============================================================================
# XDG
# ============================================================================

export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"


# ----------------------------------------------------------------------------
# XDG: user-dirs
# ----------------------------------------------------------------------------

# user-dirs.dirs doesn't exist on macOS, so check first.
# Exporting is fine since the file is generated via xdg-user-dirs-update
# and should have those vars. I am just using the defaults but want them
# explicitly defined.
# shellcheck source=/dev/null
[ -f "${XDG_CONFIG_HOME}/user-dirs.dirs" ] \
  && . "${XDG_CONFIG_HOME}/user-dirs.dirs" \
  && export \
    XDG_DESKTOP_DIR \
    XDG_DOWNLOAD_DIR \
    XDG_TEMPLATES_DIR \
    XDG_PUBLICSHARE_DIR \
    XDG_DOCUMENTS_DIR \
    XDG_MUSIC_DIR \
    XDG_PICTURES_DIR \
    XDG_VIDEOS_DIR \
  && NAN_SOURCE="${NAN_SOURCE} -> ${XDG_CONFIG_HOME}/user-dirs.dirs"

export XDG_DOWNLOAD_DIR="${XDG_DOWNLOAD_DIR:-${HOME}/Downloads}"

# ============================================================================
# History -- except HISTFILE location is set by shell rc file
# ============================================================================

export HISTSIZE=50000
export HISTFILESIZE=$HISTSIZE
export SAVEHIST=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"

# ============================================================================
# Miscellaneous
# ============================================================================

# less
# -F quit if one screen (default)
# -N line numbers
# -R raw control chars (default)
# -X don't clear screen on quit
# -e LESS option to quit at EOF
# export LESS="-eFRX"
# disable less history
# export LESSHISTFILE=-

# man
## export MANWIDTH=88
# export MANPAGER="$PAGER"

export ASDF_DIR="${HOME}/.asdf"

# ----------------------------------------------------------------------------
# editor
# ----------------------------------------------------------------------------

export EDITOR="nvim"
export VISUAL="nvim"

# ----------------------------------------------------------------------------
# pager
# ----------------------------------------------------------------------------

# export PAGER="less"
# export GIT_PAGER="$PAGER"
