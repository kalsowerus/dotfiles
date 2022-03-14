dir=$(dirname $(readlink "$HOME/.zshrc"))

# Manual installations/updates
$dir/install.sh antigen "$HOME/.zsh/antigen/antigen.zsh" 'zsh-users/antigen' 'bin/antigen.zsh'
$dir/install.sh vim-plug "$HOME/.vim/autoload/plug.vim" 'junegunn/vim-plug' 'plug.vim'
$dir/install.sh nvm "$HOME/.zsh/nvm/nvm.sh" 'nvm-sh/nvm' 'nvm.sh'

source "$HOME/.zsh/nvm/nvm.sh"

# Antigen stuff
source "$HOME/.zsh/antigen/antigen.zsh"

antigen use oh-my-zsh

antigen bundle git
antigen bundle fzf
antigen bundle sudo
antigen bundle gradle
antigen bundle extract
antigen bundle npm
antigen bundle nvm
antigen bundle command-not-found
antigen bundle colored-man-pages

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle Aloxaf/fzf-tab
antigen bundle unixorn/autoupdate-antigen.zshplugin

antigen bundle kalsowerus/zsh-bitwarden@develop

antigen theme kalsowerus/kalsowerus.zsh-theme@develop

antigen apply

# other stuff

setopt auto_cd

