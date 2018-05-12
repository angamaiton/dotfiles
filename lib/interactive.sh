# not entirely sure why I need this yet

NAN_SOURCE="${NAN_SOURCE} -> lib/interactive.sh {"

# I don't think this first part is supposed to be here
. "${DOTFILES}/lib/pretty.sh"
. "${DOTFILES}/lib/helpers.sh"
. "${DOTFILES}/lib/aliases.sh"

export NAN_SOURCE="${NAN_SOURCE} }"