NAN_SOURCE="${NAN_SOURCE} -> zplugin.zsh {"

# Needed first for turbo mode
zplugin light 'zdharma/fast-syntax-highlighting'

# zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure

# ----------------------------------------------------------------------------
# Vendor: Commands
# ----------------------------------------------------------------------------

zplugin light 'shannonmoeller/up'

# ----------------------------------------------------------------------------
# Vendor: ZSH extension
# ----------------------------------------------------------------------------

zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

# In-line best history match suggestion
# don't suggest lines longer than
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=48
# as of v4.0 use ZSH/zpty module to async retrieve
#export ZSH_AUTOSUGGEST_USE_ASYNC=1
zplugin ice silent wait'1' atload'_zsh_autosuggest_start'
zplugin light 'zsh-users/zsh-autosuggestions'
# clear the suggestion when entering completion select menu
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=("expand-or-complete")

# ----------------------------------------------------------------------------
# Vendor: prompt
# ----------------------------------------------------------------------------

zplugin light 'denysdovhan/spaceship-prompt'

# ----------------------------------------------------------------------------
# Vendor: Completion
# ----------------------------------------------------------------------------

zplugin light 'zsh-users/zsh-completions'

zplugin light 'vasyharan/zsh-brew-services'


# ----------------------------------------------------------------------------
# zplugin management
# ----------------------------------------------------------------------------

zplugin light zdharma/zui
zplugin ice wait'[[ -n ${ZLAST_COMMANDS[(r)cras*]} ]]'
zplugin load zdharma/zplugin-crasis

export NAN_SOURCE="${NAN_SOURCE} }"
