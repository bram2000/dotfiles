# Depends on the git plugin for work_in_progress()

ZSH_THEME_GIT_PROMPT_PREFIX="%F{226}[%F{green}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{226}]%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}*%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(git_current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)%F{226}$(work_in_progress)%f$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# RVM component of prompt
ZSH_THEME_RVM_PROMPT_PREFIX="%F{red}["
ZSH_THEME_RVM_PROMPT_SUFFIX="]%f"

# Combine it all into a final right-side prompt
RPS1='$(git_custom_status)$(ruby_prompt_info) $EPS1'

PROMPT='%F{226}[%F{208}%~% %F{226}]%(?.%F{green}.%F{red})$%b '
