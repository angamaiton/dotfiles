# VARIOUS THINGS SHOULD BE LOADED BEFORE THIS POINT

# sourced only on interactive/TTY
# sourced on login after zprofile
# sourced when you type ZSH

[[ -n "$TMUX" ]] && NAN_SOURCE="${NAN_SOURCE} -> ____TMUX____ {"
NAN_SOURCE="${NAN_SOURCE} -> .zshrc {"

. "${HOME}/.dotfiles/shell/dot.profile"
. "${DOTFILES}/shell/interactive.sh"

# dedupe these path arrays (they shadow PATH, FPATH, etc)
typeset -gU cdpath path fpath manpath

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
  __nan_source "${ZDOTDIR}/config/zplugin.zsh"
}
else
  __nan_warn "wget is required for zplugin."
fi

# ============================================================================
# compinit
# ============================================================================

# must be after sourcing zplugin and before cdreplay
autoload -Uz compinit; compinit

# ============================================================================
# Plugins: fasd
# ============================================================================

__nan_has "fasd" && eval "$(fasd --init posix-alias zsh-hook)"

if [[ -d "${HOME}/.asdf" ]]; then
  __nan_source "${HOME}/.asdf/asdf.sh"
else
  __nan_echo "Installing ASDF..."
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.3
  __nan_source "${HOME}/.asdf/asdf.sh"
fi

CDPATH=.:$HOME:$HOME/github:$HOME/github/angamaiton:$HOME/projects:$HOME/clients:$HOME/Downloads:$HOME/learning

export NAN_SOURCE="${NAN_SOURCE} }"
