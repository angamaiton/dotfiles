# dot.zshenv

# Symlinked to ~/.zshenv
# OUTPUT FORBIDDEN
# zshenv is always sourced, even for bg jobs

NAN_SOURCE="${NAN_SOURCE} -> .zshenv {"

# ============================================================================
# ZSH settings
# ============================================================================

# using prompt expansion and modifiers to get
#   realpath(dirname(absolute path to this file)
#   https://github.com/filipekiss/dotfiles/commit/c7288905178be3e6c378cc4dea86c1a80ca60660#r29121191
export ZDOTDIR="${${(%):-%N}:A:h}"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME}/zshcache"
export HISTFILE="${HOME}/.local/zsh_history"

export NAN_SOURCE="${NAN_SOURCE} }"

