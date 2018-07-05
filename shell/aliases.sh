export NAN_SOURCE="${NAN_SOURCE} -> shell/aliases.sh"

# ----------------------------------------------------------------------------
# safeguarding
# @see {@link https://github.com/sindresorhus/guides/blob/master/how-not-to-rm-yourself.md#safeguard-rm}
# ----------------------------------------------------------------------------

alias rm='rm -i'

# ----------------------------------------------------------------------------
# paths and dirs
# ----------------------------------------------------------------------------

alias ..='cd -- ..'
alias ....='cd -- ../..'
alias cd-='cd -- -'
alias cdd='cd -- "${DOTFILES}"'
alias cdv='cd -- "${VDOTDIR}"'
alias dirs='dirs -v' # default to vert, use -l for list
alias down='cd -- "${XDG_DOWNLOAD_DIR}"'
alias downs='down'
alias tree='tree -CF'

# ----------------------------------------------------------------------------
# cat (prefer bin/dog)
# ----------------------------------------------------------------------------

alias crm='dog README.md'

# ----------------------------------------------------------------------------
# editors
# ----------------------------------------------------------------------------

alias e="e"
alias uedit="nvim +PlugInstall +PlugUpdate +PlugClean! +qa"
alias c="code"

# ----------------------------------------------------------------------------
# git
# ----------------------------------------------------------------------------

if command -v hub >/dev/null; then alias g='hub'; else alias g='git'; fi
alias g-='g checkout -'
alias gaa='g add .'
alias gb='g branch --verbose'
alias gcms="g commit -m"
alias gi='g ink'
alias gg='g grep --line-number --break --heading'
alias gl='g l --max-count 25'
alias gm='g checkout master'
alias gp='g push'
alias gpo='g push origin'
alias gs='g status'
alias gt='g take'

# ----------------------------------------------------------------------------
# greppers
# ----------------------------------------------------------------------------

alias f='find'
alias grep='grep --color=auto'
alias rg='rg --hidden --smart-case --ignore-file "${DOTFILES}/ag/dot.ignore"'

# always prefer ripgrep
if command -v rg >/dev/null; then
  alias ag='rg'
elif command -v ag >/dev/null; then
  # --numbers is a default and not supported on old ag
  # --one-device not supported on old ag
  alias ag='ag --hidden --smart-case'
fi

# ============================================================================
# languages/environments
# ============================================================================

# ----------------------------------------------------------------------------
# node.js
# ----------------------------------------------------------------------------

alias n="npm"
alias ni="n install"
alias nig="n install --global"
alias no="n outdated --long"
alias nomod="rm -rf ./node_modules"
alias nr="n run"
alias ns="n start"
alias nt="n test"
alias sme="source-map-explorer"

alias y="yarn"
alias yi="yarn install"
alias yi="yarn run"
alias yt="yarn test"

# ----------------------------------------------------------------------------
# python
# ----------------------------------------------------------------------------

alias py2="python2"
alias py3="python3"
alias py="python"

alias pir='pip install --requirement=requirements.txt'


# ============================================================================
# Meta
# ============================================================================

alias dotf="cd ${DOTFILES}"
alias dotl="cd ${DOTFILES}/local"

alias evr="dotf && ${EDITOR} vim/vimrc"
alias evp="dotf && ${EDITOR} vim/autoload/nanplug/plugins.vim"
alias ezs="dotf && ${EDITOR} zsh/.zshrc"

alias u="dot"
alias xit="exit"

# ----------------------------------------------------------------------------
# sudo ops
# ----------------------------------------------------------------------------

alias mine='sudo chown -R "$USER"'
alias root='sudo -s'
alias se='sudo -e'

# ----------------------------------------------------------------------------
# tmux
# ----------------------------------------------------------------------------

alias tmux='tmux -f "${DOTFILES}/tmux/tmux.conf"'
alias tks="tmux kill-server"

# ============================================================================
# binaries
# ============================================================================

alias brokensymlinks='find . -type l ! -exec test -e {} \; -print'
alias mdl='mdl --config "${DOTFILES}/mdl/dot.mdlrc"'
alias o='open'

# ----------------------------------------------------------------------------
# miscellaneous/experimentation
# ----------------------------------------------------------------------------

# alias ls="exa"
# alias la="ls -a"
# alias ll="ls -l"
# alias lt="ls -l -T"
# alias lg="ls -l -G"
# alias l="ls -alG"

alias path='echo $PATH | tr -s ":" "\n"'

alias realias="source ${DOTFILES}/shell/aliases.sh"

__alias_ls() {
  __almost_all='-A' # switched from --almost-all for old bash support
  __classify='-F'   # switched from --classify for old bash support
  __colorized='--color=auto'
  __groupdirs='--group-directories-first'
  __literal=''
  __long='-l'
  __single_column='-1'
  __timestyle=''

  if ! ls $__groupdirs >/dev/null 2>&1; then
    __groupdirs=''
  fi

  if [ "$DOTFILES_OS" = 'Darwin' ]; then
    __almost_all='-A'
    __classify='-F'
    __colorized='-G'
  elif [ "$DOTFILES_OS" = 'Linux' ] \
    && [ "$DOTFILES_DISTRO" != 'busybox' ]; then
    __literal='-N'
    __timestyle='--time-style="+%Y%m%d"'
  fi

  # shellcheck disable=SC2139
  alias ls="ls $__colorized $__literal $__classify $__groupdirs $__timestyle"
  # shellcheck disable=SC2139
  alias la="ls $__almost_all"
  # shellcheck disable=SC2139
  alias l="ls $__single_column $__almost_all"
  # shellcheck disable=SC2139
  alias ll="l $__long"
  # shit
  alias kk='ll'
}
__alias_ls
