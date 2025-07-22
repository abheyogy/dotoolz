# Correction and globbing
setopt correct
setopt extendedglob
setopt nocaseglob
setopt numericglobsort
setopt nobeep

# Navigation
setopt autocd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt auto_name_dirs
setopt cdable_vars

# Completion
setopt always_to_end
setopt auto_menu
setopt complete_in_word
setopt menu_complete
setopt auto_list
setopt auto_param_slash
setopt complete_aliases
setopt hash_list_all
setopt list_ambiguous
setopt list_types

# History (extended options)
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_verify
setopt share_history
setopt histignorealldups

# Enhanced features
setopt rcexpandparam
setopt nocheckjobs
setopt multios

# Disable GUI prompts
unset GPG_AGENT_INFO
unset SSH_ASKPASS