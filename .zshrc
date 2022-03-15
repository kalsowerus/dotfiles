dir=$(dirname $(readlink "$HOME/.zshrc"))

# Manual installations/updates
$dir/install.sh antigen "$HOME/.zsh/antigen/antigen.zsh" 'zsh-users/antigen' 'bin/antigen.zsh'
$dir/install.sh vim-plug "$HOME/.vim/autoload/plug.vim" 'junegunn/vim-plug' 'plug.vim'
$dir/install.sh nvm "$HOME/.zsh/nvm/nvm.sh" 'nvm-sh/nvm' 'nvm.sh'

source "$HOME/.zsh/nvm/nvm.sh"
nvm install --lts >/dev/null 2>&1
nvm use --lts >/dev/null

if ! command -v bw >/dev/null 2>&1; then
    npm i -g @bitwarden/cli
fi

export K_COLOR_BR="01;33"
export LESS='-R --mouse --wheel-lines=2'

(( ! ${+HOST_IP} )) && export HOST_IP=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null)
(( ! ${+LIBGL_ALWAYS_INDIRECT} )) && export LIBGL_ALWAYS_INDIRECT=1
(( ! ${+DISPLAY} )) && export DISPLAY=${HOST_IP}:0

(( ! ${+JAVA_HOME} )) && export JAVA_HOME=/opt/jdk
[[ -d "$JAVA_HOME" ]] && export PATH="$PATH:$JAVA_HOME/bin"

[[ -d "$HOME/bin" ]] && export PATH="$PATH:$HOME/bin"

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
antigen bundle kalsowerus/zsh-git-ls@develop
antigen bundle kalsowerus/zsh-bitwarden@develop

antigen theme kalsowerus/kalsowerus.zsh-theme@develop

antigen apply

alias l='git-ls -Ah --group-directories-first'

