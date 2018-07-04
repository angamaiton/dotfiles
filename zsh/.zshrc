# VARIOUS THINGS SHOULD BE LOADED BEFORE THIS POINT

# sourced only on interactive/TTY
# sourced on login after zprofile
# sourced when you type ZSH

[[ -n "$TMUX" ]] && NAN_SOURCE="${NAN_SOURCE} -> ____TMUX____ {"
NAN_SOURCE="${NAN_SOURCE} -> .zshrc {"

. "${HOME}/.dotfiles/shell/dot.profile"
. "${DOTFILES}/shell/interactive.sh"

export HISTORY_IGNORE="(pwd|l|ls|ll|cl|clear)"

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

# enable menu selection
zmodload -i zsh/complist

# run compdefs provided by plugins
__nan_has 'zplugin' && zplugin cdreplay -q

# ============================================================================
# Title
# ============================================================================

. "${ZDOTDIR}/config/title.zsh"

# ----------------------------------------------------------------------------
# Plugins: fasd
# ----------------------------------------------------------------------------

__nan_has "fasd" && eval "$(fasd --init posix-alias zsh-hook)"

if [[ -d "${HOME}/.asdf" ]]; then
  __nan_source "${HOME}/.asdf/asdf.sh"
else
  __nan_echo "Installing ASDF..."
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.3
  __nan_source "${HOME}/.asdf/asdf.sh"
fi

# ----------------------------------------------------------------------------
# Plugins: fzf (installed via brew)
# ----------------------------------------------------------------------------

if [[ -d /usr/local/opt/fzf ]]; then
  [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]] &&
    export PATH="$PATH:/usr/local/opt/fzf/bin"
  __nan_source "/usr/local/opt/fzf/shell/completion.zsh"
  __nan_source "/usr/local/opt/fzf/shell/key-bindings.zsh"
  NAN_SOURCE="${NAN_SOURCE} -> fzf"
fi

# ============================================================================
# Keybindings
# ============================================================================

. "${ZDOTDIR}/config/keybindings.zsh"

# ============================================================================
# Local
# ============================================================================

. "${DOTFILES}/shell/after.sh"

. "${ZDOTDIR}/config/tmux.zsh"

export NAN_SOURCE="${NAN_SOURCE} }"
