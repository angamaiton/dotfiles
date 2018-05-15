# not entirely sure why I need this yet

NAN_SOURCE="${NAN_SOURCE} -> shell/interactive.sh {"

# I don't think this first part is supposed to be here
. "${DOTFILES}/lib/pretty.bash"
. "${DOTFILES}/lib/helpers.sh"
. "${DOTFILES}/shell/functions.sh" # shell functions
. "${DOTFILES}/shell/aliases.sh"

# ============================================================================
# OS-specific aliases
# ============================================================================

# case "$(uname)" in
#   Linux*)
#     . "${DOTFILES}/shell/aliases-linux.sh"
#     case "$DOTFILES_DISTRO" in
#       "archlinux" | "debian" | "fedora")
#         . "${DOTFILES}/shell/aliases-${DOTFILES_DISTRO}.sh"
#         ;;
#     esac
#     ;;
# esac

export NAN_SOURCE="${NAN_SOURCE} }"