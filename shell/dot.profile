# Used by /bin/sh shell
# Sourced on login shells only
# Sourced by ~/.bash_profile if in a BASH login shell
# Sourced by $ZDOTDIR/.zprofile if in a ZSH login shell
# NOTE: macOS always starts a login shell

NAN_SOURCE="${NAN_SOURCE} -> dot.profile {"
[ -z "$NAN_INIT" ] && . "${HOME}/.dotfiles/shell/init.sh"

# ==============================================================================
# env management
# ==============================================================================

. "${DOTFILES}/lib/helpers.sh"

# ==============================================================================
# Local path (?)
# ==============================================================================

PATH="${HOME}/.local/bin:${PATH}"
PATH="${DOTFILES}/bin:${PATH}"
export PATH

# ============================================================================
# POSIX sh support
# ============================================================================

[ -n "$NAN_SH" ] && . "${DOTFILES}/shell/interactive.sh"

export NAN_SOURCE="${NAN_SOURCE} }"