#!/bin/zsh

name="$1"
install_path="$2"
repo="$3"
file="$4"
branch="${5:-master}"
sha_file="$HOME/.zsh/$name/sha"

get_sha() {
    local response
    response=$(curl -sH 'Accept: application/vnd.github.v3.sha' "https://api.github.com/repos/$repo/commits/$branch?per_page=1")
    if (( $? == 0 )); then
        echo "$response"
        return 0
    else
        return 1
    fi
}

check_installed() {
    if [[ ! -e "$sha_file" ]]; then
        return 1
    fi

    if [[ ! -e "$install_path" ]]; then
        return 1
    fi

    local installed_sha=$(cat "$sha_file")
    local remote_sha=$(get_sha)

    if [[ -n "$remote_sha" ]] && [[ "$installed_sha" != "$remote_sha" ]]; then
        return 1
    fi
}

install() {
    if ! check_installed; then
        echo "Installing $name..."
        curl -sfLo "$install_path" --create-dirs "https://raw.githubusercontent.com/$repo/$branch/$file"
        mkdir -p $(dirname "$sha_file")
        get_sha > "$sha_file" 
    fi
}

install

