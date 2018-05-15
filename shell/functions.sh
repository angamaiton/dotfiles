export NAN_SOURCE="${NAN_SOURCE} -> shell/functions.sh"

# ============================================================================
# Scripting
# ============================================================================

current_shell() {
  ps -p $$ | awk 'NR==2 { print $4 }'
}

# ============================================================================
# Directory
# ============================================================================

# Go to git root
cdr() {
  git rev-parse || return 1
  cd -- "$(git rev-parse --show-cdup)" || return 1
}

# ============================================================================
# Archiving
# ============================================================================

# Export repo files to specified dir
gitexport() {
  to_dir="${2:-./gitexport}"
  rsync -a "${1:-./}" "$to_dir" --exclude "$to_dir" --exclude .git
}

# ============================================================================
# Network tools
# ============================================================================

mykey() {
  cat "$HOME/.ssh/id_rsa.pub"
  if __nan_has "pbcopy"; then
    pbcopy <"$HOME/.ssh/id_rsa.pub"
  elif __nan_has "xclip"; then
    xclip "$HOME/.ssh/id_rsa.pub"
  fi
}