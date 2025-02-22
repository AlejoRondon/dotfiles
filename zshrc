# zgen
source ~/.zgen/zgen.zsh
if ! zgen saved; then
  echo "Creating a zgen save"

  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-syntax-highlighting
  zgen oh-my-zsh plugins/history-substring-search # MUST be after zsh-syntax-highlighting
  zgen oh-my-zsh plugins/gpg-agent
  zgen oh-my-zsh plugins/sudo
  zgen oh-my-zsh plugins/httpie
  zgen oh-my-zsh plugins/command-not-found
  zgen load zsh-users/zsh-completions src
  zgen load chrissicool/zsh-256color
  zgen load johnhamelink/env-zsh
  zgen load theunraveler/zsh-fancy_ctrl_z
  zgen load BurntSushi/ripgrep complete
  zgen load docker/compose contrib/completion/zsh
  zgen load tomsquest/q.plugin.zsh

  # Remove Zsh completion cache, given we may have updated a completion
  rm ~/.zcompdump || true

  zgen save
fi

# Load ASDF
# Needs to be done before compinit in config.zsh
# . $HOME/.asdf/asdf.sh
# fpath=(${ASDF_DIR}/completions $fpath)

source ~/.zsh/general_zsh/config.zsh
source ~/.zsh/general_zsh/completion.zsh
source ~/.zsh/general_zsh/aliases.zsh
source ~/.zsh/general_zsh/bindkey.zsh
source ~/.zsh/general_zsh/prompt.zsh
source ~/.zsh/general_zsh/fzf.zsh

source ~/.zsh/personal_zsh/aliases.zsh
source ~/.zsh/personal_zsh/bindkey.zsh

source ~/.zsh/globant_zsh/aliases.zsh
source ~/.zsh/globant_zsh/bindkey.zsh


# Load rupa Z: quickly jump to recent directory with the z command
# Example: z foo
# See: https://github.com/rupa/z
source ~/.rupa-z/z.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/tom/Apps/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/tom/Apps/anaconda/etc/profile.d/conda.sh" ]; then
#         . "/home/tom/Apps/anaconda/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/tom/Apps/anaconda/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# Load direnv through asdf
# source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"

# Local (to this machine) configuration
# SHOULD BE LAST
if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

echo "Hi bro!"
source ~/.zsh/general_zsh/oh_my_zsh_config.zsh
