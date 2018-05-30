# Sourced in bash and ZSH by loader
# XDG is set up in init.sh, which should already have been sourced
# pyenv, chruby, chphp, nvm pathing is done in shell/after

export NAN_SOURCE="${NAN_SOURCE} -> shell/path.sh"

# ==============================================================================
# Store default system path
# ==============================================================================

# Probably created via /etc/profile and /etc/profile.d/*
#
# On macOS/BSD path_helper is run in /etc/profile, which generates paths
# using /etc/paths and /etc/paths.d/* and defines the initial $PATH
# Something like "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
#
# On arch, via /etc/profile, default path is:
# /usr/local/sbin:/usr/local/bin:/usr/bin
export NAN_SYSTEM_PATH="${NAN_SYSTEM_PATH:-$PATH}"

# ============================================================================
# Begin composition
# ============================================================================

# On BSD system, e.g. Darwin -- path_helper is called, reads /etc/paths
# Move local bin to front for homebrew compatibility
#if [ -x /usr/libexec/path_helper ]; then
PATH="$NAN_SYSTEM_PATH"

# enforce local bin and sbin order, they come before any system paths
PATH="/usr/local/bin:/usr/local/sbin:${NAN_SYSTEM_PATH}"

# ============================================================================
# DONE
# ============================================================================

export PATH