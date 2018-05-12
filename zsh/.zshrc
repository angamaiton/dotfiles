# VARIOUS THINGS SHOULD BE LOADED BEFORE THIS POINT

# sourced only on interactive/TTY
# sourced on login after zprofile
# sourced when you type ZSH

[[ -n "$TMUX" ]] && NAN_SOURCE="${NAN_SOURCE} -> ____TMUX____ {"
NAN_SOURCE="${NAN_SOURCE} -> .zshrc {"

. "${HOME}/.dotfiles/lib/dot.profile"
. "${DOTFILES}/lib/interactive.sh"

# dedupe these path arrays (they shadow PATH, FPATH, etc)
# typeset -gU cdpath path fpath manpath

# ============================================================================
# Options
# ============================================================================

. "${ZDOTDIR}/config/options.zsh"

# ============================================================================
# zplugin
# ============================================================================

if __nan_has 'wget'; then
  if [[ ! -d "${ZDOTDIR}/.zplugin" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
  fi
  __nan_source "${ZDOTDIR}/.zplugin/bin/zplugin.zsh" || echo "[MISSING] install zplugin."
  __nan_has 'zplugin' && {
  autoload -Uz _zplugin
  (( ${+_comps} )) && _comps[zplugin]=_zplugin
  # Must be sourced above compinit
  __nan_source "${ZDOTDIR}/zplugin.zsh"
}
else
  __nan_warn "wget is required for zplugin."
fi

# ============================================================================
# compinit
# ============================================================================

# must be after sourcing zplugin and before cdreplay
autoload -Uz compinit
compinit

export NAN_SOURCE="${NAN_SOURCE} }"