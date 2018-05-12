# Make sure zplug is installed
if __nan_has 'curl'; then
  if [[ ! -d "${XDG_CONFIG_HOME}/zplug" ]]; then
    __nan_warn "[MISSING] zplug is not installed!"
    if [[ -n "$CI" ]] || [[ ! $REPLY =~ ^[Yy]$ ]]; then
      export ZPLUG_HOME="${XDG_CONFIG_HOME}/zplug"
      curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    fi
  elif [[ -d "${XDG_CONFIG_HOME}/zplug" ]]; then
    . "${XDG_CONFIG_HOME}/zplug/init.zsh"
    echo "hi"
  fi
fi