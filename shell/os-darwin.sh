# shell/os-darwin.sh

export NAN_SOURCE="${NAN_SOURCE} -> shell/os-darwin.sh"

# @see https://github.com/nojhan/liquidprompt/blob/master/liquidprompt
# uname is slower
export DOTFILES_OS="Darwin"
export DOTFILES_DISTRO="mac"
# just assume brew is in normal location, don't even check for it
export NAN_BREW_PREFIX="/usr/local"

# homebrew
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS='--require-sha'

# ============================================================================
# Functions
# ============================================================================

flushdns() {
  dscacheutil -flushcache
  sudo killall -HUP mDNSResponder
}

# list members for a group
# http://www.commandlinefu.com/commands/view/10771/osx-function-to-list-all-members-for-a-given-group
members() {
  dscl . -list /Users | while read -r user; do
    printf "%s " "$user"
    dsmemberutil checkmembership -U "$user" -G "$*"
  done | grep "is a member" | cut -d " " -f 1
}

vol() {
  __nan_has "osascript" && osascript -e "set volume ${1}"
}

# ============================================================================
# Aliases
# ============================================================================

alias b='TERM=xterm-256color \brew'
alias brew='b'

alias bi='b install'
alias bq='b list'
alias bs='b search'
alias blfn='b ls --full-name'

alias brc='b cask'
alias brci="b cask install"
alias brcu="b cask uninstall"
alias brcu="b cask reinstall"

alias bsvc='b services'
alias bsvr='b services restart'

alias ffx='open -a /Applications/Firefox.app'

# clear xattrs
alias xc='xattr -c *'

# Audio control - http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"