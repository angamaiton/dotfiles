# shell/after.sh

NAN_SOURCE="${NAN_SOURCE} -> shell/after.sh {"

# ============================================================================
# fzf
# ============================================================================

# ** is globbing completion in ZSH, use tickticktab instead
export FZF_COMPLETION_TRIGGER="\`\`"

# Use fastest grepper available
if __nan_has "rg"; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden --glob ""'
elif __nan_has "ag"; then
  export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
else
  # using git paths only for FZF
  export FZF_DEFAULT_COMMAND='
    (git ls-tree -r --name-only HEAD ||
      find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
        sed s/^..//) 2> /dev/null'
fi

export FZF_DEFAULT_OPTS='--height=20 --min-height=4'

# ============================================================================
# Use neovim
# Now that path is available, use neovim instead of vim if it is installed
# ============================================================================

__nan_has "nvim" && {
  alias e="nvim"

  export EDITOR="nvim"
  export VISUAL="nvim"

  __nan_has "nvr" && alias e="PYTHONWARNINGS=ignore nvr -s"
}

# ============================================================================
# npm stuff
# ============================================================================

__nan_has 'trash' && alias rm=trash

# ============================================================================
# fasd or z
# ============================================================================

__nan_has "fasd" && alias j="z"

# ============================================================================

# export PATH="${HOME}/development/flutter/bin:${PATH}"

unset NAN_INIT
export NAN_SOURCE="${NAN_SOURCE} }"
