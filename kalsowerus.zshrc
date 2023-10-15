dir=$(dirname $(readlink -e "${(%):-%x}"))

git -C "${HOME}/.zsh/antigen" pull >/dev/null
git -C "${HOME}/.zsh/nvm" pull >/dev/null
git -C "${HOME}/.zsh/vim-plug" pull >/dev/null

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

md2pdf() {
    if [[ "$#" -eq 0 ]]; then
        echo "Usage: ${0} <input-file> [<output-filename>]"
        return
    fi

    local filename
    filename="${2:=${1%.md}}"
    cat "$1" | sed -E 's/<img.*?src="(.*?)".*?>/![](\1)/g' | pandoc -o "/downloads/${filename%.pdf}.pdf" -V papersize:a4 -V geometry:margin=2cm
}

