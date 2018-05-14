NAN_SOURCE="${NAN_SOURCE} -> zplugin.zsh {"

# Needed first for turbo mode
zplugin light 'zdharma/fast-syntax-highlighting'

zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure

# ----------------------------------------------------------------------------
# Vendor: Commands
# ----------------------------------------------------------------------------

zplugin light 'shannonmoeller/up'

# ----------------------------------------------------------------------------
# Vendor: ZSH extension
# ----------------------------------------------------------------------------

zplugin snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

zplugin light zsh-users/zsh-autosuggestions

# ----------------------------------------------------------------------------
# Vendor: Completion
# ----------------------------------------------------------------------------

zplugin light 'vasyharan/zsh-brew-services'

export NAN_SOURCE="${NAN_SOURCE} }"