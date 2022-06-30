#!/usr/bin/env bash

set -eu -o pipefail

XDG_CONFIG_HOME="${HOME}/.config"

cd "$(dirname "${BASH_SOURCE[0]}")"
WORKDIR=$(pwd)

ln -sfv "${WORKDIR}/nvim" "${XDG_CONFIG_HOME}/"

ln -sfv "${WORKDIR}/alacritty" "${XDG_CONFIG_HOME}/"

ln -sfv "${WORKDIR}/bat" "${XDG_CONFIG_HOME}/"

ln -sfv "${WORKDIR}/tmux" "${XDG_CONFIG_HOME}/"

ln -sfv "${WORKDIR}/zsh/zshenv" "${HOME}/.zshenv"
ln -sfv "${WORKDIR}/zsh" "${XDG_CONFIG_HOME}/"

ln -sfv "${WORKDIR}/gitconfig" "${HOME}/.gitconfig"