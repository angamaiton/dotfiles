# ============================================================================
# Options
# In the order of `man zshoptions`
# ============================================================================

# Changing directories
setopt AUTO_PUSHD                     # pushd instead of cd
setopt AUTO_CD                        ## Honestly, as of now, I don't know what the difference is. Sad.
setopt CDABLE_VARS
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT                   # hide stack after cd
setopt PUSHD_TO_HOME                  # go home if no d specified

# Completion
setopt AUTO_LIST                      # list completions
setopt AUTO_MENU                      # TABx2 to start a tab complete menu
# setopt NO_COMPLETE_ALIASES            # no expand aliases before completion
setopt LIST_PACKED                    # variable column widths

# Expansion and Globbing
setopt EXTENDED_GLOB                  # like ** for recursive dirs

# History
setopt APPEND_HISTORY                 # append instead of overwrite file
setopt EXTENDED_HISTORY               # extended timestamps
setopt HIST_FIND_NO_DUPS              # ignore already-seen entries when cycling
setopt HIST_IGNORE_ALL_DUPS           # prune older entries when same entered
setopt HIST_IGNORE_SPACE              # omit from history if space prefixed
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY                    # verify when using history cmds/params

# I/O
setopt ALIASES                        # autocomplete switches for aliases
setopt AUTO_PARAM_SLASH               # append slash if autocompleting a dir
setopt NO_CORRECT

# Job Control
setopt CHECK_JOBS                     # prompt before exiting shell with bg job
setopt LONGLISTJOBS                   # display PID when suspending bg as well
setopt NO_HUP                         # do not kill bg processes

# Prompting
setopt PROMPT_SUBST                   # allow variables in prompt

# Shell Emulation
setopt INTERACTIVE_COMMENTS           # allow comments in shell

# Zle (zsh line editor)
setopt NO_BEEP
setopt VI

# Miscellaneous
setopt DOT_GLOB

# ============================================================================
# Completion settings
# Order by * specificity
# ============================================================================

# --------------------------------------------------------------------------
# Completion: Caching
# --------------------------------------------------------------------------

zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME}/.zcache"

# --------------------------------------------------------------------------
# Completion: Display
# --------------------------------------------------------------------------

# group all by the description above
zstyle ':completion:*' group-name ''

# colorful completion
zstyle ':completion:*' list-colors ''

# Updated to respect LS_COLORS
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

zstyle ':completion:*' list-dirs-first yes

# go into menu mode on second tab (like current vim wildmenu setting)
# only if there's more than two things to choose from
zstyle ':completion:*' menu select=2

# show descriptions for options
zstyle ':completion:*' verbose yes

# in Bold, specify what type the completion is, e.g. a file or an alias or
# a cmd
zstyle ':completion:*:descriptions' format '%F{black}%B%d%b%f'

# --------------------------------------------------------------------------
# Completion: Matching
# --------------------------------------------------------------------------

# use case-insensitive completion if case-sensitive generated no hits
zstyle ':completion:*' matcher-list \
  'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'

# don't complete usernames
zstyle ':completion:*' users ''

# don't autocomplete homedirs
zstyle ':completion::complete:cd:*' tag-order '! users'

# --------------------------------------------------------------------------
# Completion: Output transformation
# --------------------------------------------------------------------------

# expand completions as much as possible on tab
# e.g. start expanding a path up to wherever it can be until error
zstyle ':completion:*' expand yes

# process names
zstyle ':completion:*:processes-names' command \
  'ps c -u ${USER} -o command | uniq'

# rsync and SSH use hosts from ~/.ssh/config
[ -r "$HOME/.ssh/config" ] && {
  # Vanilla parsing of config file :)
  # @see {@link https://github.com/Eriner/zim/issues/46#issuecomment-219344931}
  hosts=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
  #hosts=($(egrep '^Host ' "$HOME/.ssh/config" | grep -v '*' | awk '{print $2}' ))
  zstyle ':completion:*:ssh:*'    hosts $hosts
  zstyle ':completion:*:rsync:*'  hosts $hosts
}

# colorful kill command completion -- probably overridden by fzf
zstyle ':completion:*:*:kill:*:processes' list-colors \
  "=(#b) #([0-9]#)*=36=31"

# complete .log filenames if redirecting stderr
zstyle ':completion:*:*:-redirect-,2>,*:*' file-patterns '*.log'

# ----------------------------------------------------------------------------
# Completion: cdpath
# ----------------------------------------------------------------------------

cdpath=($HOME/Downloads $HOME/projects $HOME/sandbox $HOME)
