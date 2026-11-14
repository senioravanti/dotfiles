# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)

prompt_git_branch() {
  autoload -Uz vcs_info 
  precmd_vcs_info() { 
    vcs_info 
  }
  precmd_functions+=( precmd_vcs_info )
  setopt prompt_subst
  zstyle ':vcs_info:git:*' formats '%b'
}

prompt_git_info() {
    [ ! -z "$vcs_info_msg_0_" ] && echo "$ZSH_THEME_GIT_PROMPT_PREFIX%F{white}$vcs_info_msg_0_%f$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

prompt_purity_precmd() {
    # Pass a line before each prompt
    print -P ''
}

prompt_purification_setup() {
    # Display git branch

    autoload -Uz add-zsh-hook
    add-zsh-hook precmd prompt_purity_precmd

    ZSH_THEME_GIT_PROMPT_PREFIX=" %F{red}\uf418%f:"
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    ZSH_THEME_GIT_PROMPT_ADDED="%F{green}+%f "
    ZSH_THEME_GIT_PROMPT_MODIFIED="%F{blue}%f "
    ZSH_THEME_GIT_PROMPT_DELETED="%F{red}x%f "
    ZSH_THEME_GIT_PROMPT_RENAMED="%F{magenta}➜%f "
    ZSH_THEME_GIT_PROMPT_UNMERGED="%F{yellow}═%f "
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{white}\uf111%f "
    ZSH_THEME_GIT_PROMPT_STASHED="%B%F{red}%f%b "
    ZSH_THEME_GIT_PROMPT_BEHIND="%B%F{red}%f%b "
    ZSH_THEME_GIT_PROMPT_AHEAD="%B%F{green}%f%b "

    prompt_git_branch
    RPROMPT='$(prompt_git_info)'
    PROMPT=$'%F{white}%~ %B%F{blue}>%f%b '
}

prompt_purification_setup