# if [[ ! -d "${XDG_CONFIG_HOME}/zplug" ]]; then
#   $ curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
#   export ZPLUG_HOME="${XDG_CONFIG_HOME}/zplug"
# fi

# . "${ZPLUG_HOME}/init.zsh"

# zplug load

# # zplug zsh-users/zsh-syntax-highlighting
# # zplug mafredri/zsh-async, from:github
# # zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# if ! zplug check --verbose; then
#   printf "Install? [y/N]: "
#   if read -q; then
#     echo; zplug install
#   fi
# fi

# # fpath=(
# #   /usr/local/share/zsh-completions
# #   /usr/local/share/zsh/site-functions
# #   $fpath
# # )
# echo "test"

# zplug load

# autoload -Uz compinit; compinit
# autoload -U promptinit; promptinit
# prompt pure