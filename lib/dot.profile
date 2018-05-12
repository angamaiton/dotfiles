# Used by /bin/sh shell
# Sourced on login shells only
# Sourced by ~/.bash_profile if in a BASH login shell
# Sourced by $ZDOTDIR/.zprofile if in a ZSH login shell
# NOTE: macOS always starts a login shell

[ -z "$NAN_INIT" ] && . "${HOME}/.dotfiles/lib/init.sh"

# ==============================================================================
# env management
# ==============================================================================

. "${DOTFILES}/lib/helpers.sh"