# Source me

# std logging
# Based on http://serverwizard.heroku.com/script/rvm+git
# added error output to stderr
__nan_echo()    { printf           '          %s\033[0;m\n' "$1"; }
__nan_status()  { printf '\033[0;34m==>       %s\033[0;m\n' "$1"; }
__nan_status_() { printf '\033[0;34m          %s\033[0;m\n' "$1"; }
__nan_ok()      { printf '\033[0;32m==> OK:   %s\033[0;m\n' "$1"; }
__nan_ok_()     { printf '\033[0;32m==>       %s\033[0;m\n' "$1"; }
__nan_err()     { printf '\033[0;31m==> ERR:  %s\033[0;m\n' "$1" >&2; }
__nan_err_()    { printf '\033[0;31m          %s\033[0;m\n' "$1" >&2; }
__nan_warn()    { printf '\033[0;33m==> WARN: %s\033[0;m\n' "$1" >&2; }
__nan_warn_()   { printf '\033[0;33m          %s\033[0;m\n' "$1" >&2; }
__nan_usage()   { printf '\033[0;34m==> USAGE: \033[0;32m%s\033[0;m\n' "$1"; }
__nan_usage_()  { printf '\033[0;29m           %s\033[0;m\n' "$1"; }
