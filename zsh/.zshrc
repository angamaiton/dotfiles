# VARIOUS THINGS SHOULD BE LOADED BEFORE THIS POINT

# sourced only on interactive/TTY
# sourced on login after zprofile
# sourced when you type ZSH

[[ -n "$TMUX" ]] && NAN_SOURCE="${NAN_SOURCE} -> ____TMUX____ {"
NAN_SOURCE="${NAN_SOURCE} -> .zshrc {"

# echo $DOTFILES
. "${HOME}/.dotfiles/lib/dot.profile"
. "${DOTFILES}/lib/interactive.sh"

__load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        # if [ ${config:e} = "zwc" ] ; then continue ; fi
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [[ -f $config && ${config:e} != "zwc" ]]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      # what is the (N-.) part
      for config in "$_dir"/post/**/*(N-.); do
        # What the fuck does this do?
        # if [ ${config:e} = "zwc" ] ; then continue ; fi
        . $config
      done
    fi
  fi
}
echo "From ZSHRC – ${ZDOTDIR}"
__load_settings "${ZDOTDIR}/config"

export NAN_SOURCE="${NAN_SOURCE} }"

echo $NAN_SOURCE