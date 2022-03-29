dir=$(dirname $(readlink -e "${(%):-%x}"))

# Manual installations/updates
$dir/install.sh antigen "$HOME/.zsh/antigen/antigen.zsh" 'zsh-users/antigen' 'bin/antigen.zsh'
$dir/install.sh vim-plug "$HOME/.vim/autoload/plug.vim" 'junegunn/vim-plug' 'plug.vim'
$dir/install.sh nvm "$HOME/.zsh/nvm/nvm.sh" 'nvm-sh/nvm' 'nvm.sh'

source "$HOME/.zsh/nvm/nvm.sh"

if ! command -v npm >/dev/null 2>&1; then
    nvm install --lts >/dev/null 2>&1
    nvm use --lts >/dev/null
fi

if ! command -v bw >/dev/null 2>&1; then
    npm i -g @bitwarden/cli
fi

export LESS='-R --mouse --wheel-lines=2'

if grep -qi microsoft /proc/version; then
    (( ! ${+HOST_IP} )) && export HOST_IP=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null)
    (( ! ${+DISPLAY} )) && export DISPLAY=${HOST_IP}:0
fi

(( ! ${+JAVA_HOME} )) && export JAVA_HOME=/opt/jdk
[[ -d "$JAVA_HOME" ]] && export PATH="$PATH:$JAVA_HOME/bin"

[[ -d "$HOME/bin" ]] && export PATH="$PATH:$HOME/bin"

# Antigen stuff
source "$HOME/.zsh/antigen/antigen.zsh"

antigen use oh-my-zsh

antigen bundles << EOBUNDLES
git
fzf
sudo
gradle
extract
npm
nvm
command-not-found
colored-man-pages

zsh-users/zsh-autosuggestions
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
Aloxaf/fzf-tab
unixorn/autoupdate-antigen.zshplugin
kalsowerus/zsh-git-ls@develop
kalsowerus/zsh-bitwarden@develop
EOBUNDLES

antigen theme kalsowerus/kalsowerus.zsh-theme@develop

antigen apply

alias l='git-ls -AFh --group-directories-first'

