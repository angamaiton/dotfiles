
# std logging
# Based on http://serverwizard.heroku.com/script/rvm+git
# added error output to stderr
__nan_status()  { printf '\033[0;34m==>       %s\033[0;m\n' "$1"; }
__nan_warn()    { printf '\033[0;33m==> WARN: %s\033[0;m\n' "$1" >&2; }