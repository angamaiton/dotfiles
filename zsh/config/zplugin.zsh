NAN_SOURCE="${NAN_SOURCE} -> zplugin.zsh {"

# Needed first for turbo mode
# zplugin light 'zdharma/fast-syntax-highlighting'

# zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure

# ----------------------------------------------------------------------------
# Vendor: Commands
# ----------------------------------------------------------------------------

# zplugin light tj/git-extras

zplugin ice wait"1" lucid as"program" pick"git-open"
zplugin light paulirish/git-open

zplugin ice wait"1" lucid as"program" pick"git-recent"
zplugin light paulirish/git-recent

# replaces up() in shell/functions.sh
zplugin light shannonmoeller/up

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
zplugin light zsh-users/zsh-autosuggestions
# clear the suggestion when entering completion select menu
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=("expand-or-complete")

# ----------------------------------------------------------------------------
# Vendor: prompt
# ----------------------------------------------------------------------------

# zplugin light 'denysdovhan/spaceship-prompt'
zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

# ----------------------------------------------------------------------------
# Vendor: Completion
# ----------------------------------------------------------------------------

zplugin light zsh-users/zsh-completions

zplugin light lukechilds/zsh-better-npm-completion

zplugin light vasyharan/zsh-brew-services

zplugin light zsh-users/zsh-syntax-highlighting

# ----------------------------------------------------------------------------
# zplugin management
# ----------------------------------------------------------------------------

export NAN_SOURCE="${NAN_SOURCE} }"
