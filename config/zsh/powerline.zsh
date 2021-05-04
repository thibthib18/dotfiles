
# POWERLEVEL10k theme
is_docker(){
  local inside_container=$(~/dotfiles/scripts/docker/is_docker.sh)
  local icon=$(echo $inside_container | grep 'inside' >/dev/null && echo '' || echo '')
  local color='%F{blue}'
  echo -n "%{$color%}$icon%{%f%}"
}
POWERLEVEL9K_CUSTOM_IS_DOCKER="is_docker"

POWERLEVEL9K_MODE=awesome-fontconfig
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status time ram custom_is_docker)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir_writable dir vcs)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MODE="nerdfont-complete"
P9KGT_BACKGROUND='light'
P9KGT_COLORS='light'
antigen theme romkatv/powerlevel10k powerlevel10k


