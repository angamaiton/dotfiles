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
setopt NO_COMPLETE_ALIASES            # no expand aliases before completion
setopt LIST_PACKED                    # variable column widths

# Expansion and Globbing
setopt EXTENDED_GLOB                  # like ** for recursive dirs

# I/O
setopt ALIASES                        # autocomplete switches for aliases
setopt AUTO_PARAM_SLASH               # append slash if autocompleting a dir
setopt NO_CORRECT

# Prompting
setopt PROMPT_SUBST                   # allow variables in prompt

# Shell Emulation
setopt INTERACTIVE_COMMENTS           # allow comments in shell

# Zle (zsh line editor)
setopt NO_BEEP
setopt VI

# Make sure zplug is installed
if __nan_has 'curl'; then
  if [[ ! -d "${XDG_CONFIG_HOME}/zplug" ]]; then
    __nan_warn "[MISSING] zplug is not installed!"
    echo -n "Enter [y/n] : " ; read opt
    if [[ $opt =~ ^[Yy]$ ]]; then
      curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
      . "${ZPLUG_HOME}/init.zsh"
      return
    fi
  else
    . "${ZPLUG_HOME}/init.zsh"
    . "${ZDOTDIR}/config/post/zplug.zsh"
  fi
else
  __nan_warn "[MISSING] curl is not installed (for some reason)!"
fi