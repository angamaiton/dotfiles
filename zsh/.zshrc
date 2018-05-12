__load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    # if [ -d "$_dir/pre" ]; then

    # fi
    for config in "$_dir"/**/*; do
      . $config
      echo $config
    done
  fi
}
# echo "From ZSHRC – ${ZDOTDIR}"
__load_settings "${ZDOTDIR}/config"