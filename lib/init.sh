NAN_SOURCE="${NAN_SOURCE} -> lib/init.sh {"
export NAN_INIT=1

# ============================================================================

. "${HOME}/.dotfiles/lib/vars.sh"

# Rebuild path starting from system path
# Regarding tmux:
# Since my tmux shells are not login shells the path needs to be rebuilt.
# lib/vars.sh on the other hand just get inherited.
. "${DOTFILES}/lib/path.sh"

# ============================================================================

export NAN_SOURCE="${NAN_SOURCE} }"