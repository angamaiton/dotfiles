zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load