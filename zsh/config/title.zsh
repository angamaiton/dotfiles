# zsh/config/title.zsh
#
# Set title of terminal emulator
# Requires add-zsh-hook module (should have been autoloaded in .zshrc)
#

export NAN_SOURCE="${nan_SOURCE} -> title.zsh"

# print -P means use same escape chars as PROMPT
# %n          expands to $USERNAME
# %m          expands to hostname up to first '.'
# %~          expands to directory, replacing $HOME with '~'

# ============================================================================
# Hook handlers
# ============================================================================

# ----------------------------------------------------------------------------
# ansi-compatible
# ----------------------------------------------------------------------------

__nan_zhook::ansi::process() {
  print -n "\ek${1}\e\\"
}

__nan_zhook::ansi::title() {
  local title="%n@%m:%~"
  print -Pn "\e${title}\e\\"
}

__nan_ztitle::ansi() {
  add-zsh-hook preexec  __nan_zhook::ansi::process
  add-zsh-hook precmd   __nan_zhook::ansi::title
  add-zsh-hook chpwd    __nan_zhook::ansi::title
}

# ----------------------------------------------------------------------------
# xterm-compatible
# ----------------------------------------------------------------------------

__nan_zhook::xterm::process() {
  print -n "\e]0;${1}\a"
}

__nan_zhook::xterm::title() {
  local title="%n@%m:%~"
  print -Pn "\e]0;${title}\a"
}

__nan_ztitle::xterm() {
  add-zsh-hook preexec  __nan_zhook::xterm::process
  add-zsh-hook precmd   __nan_zhook::xterm::title
  add-zsh-hook chpwd    __nan_zhook::xterm::title
}

# ============================================================================
# Use title hooks
# ============================================================================

case "${TERM}" in
  rxvt*|xterm*) __nan_ztitle::xterm ;;

  # echos on tmux :<
  #*)            __nan_term::ansi ;;
esac
