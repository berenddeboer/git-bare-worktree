#!/usr/bin/env bash
set -euo pipefail

usage() {
  printf 'Usage: %s <ssh-repo-url> <target-directory>\n' "$(basename "$0")" >&2
}

if [ "$#" -ne 2 ]; then
  usage
  exit 64
fi

repo_url=$1
target_dir=$2

case "$repo_url" in
  git@*:*.git|ssh://git@*/*.git) ;;
  *)
    printf 'Error: repository must be an SSH Git URL ending in .git.\n' >&2
    printf 'Example: git@github.com:owner/repo.git\n' >&2
    exit 65
    ;;
esac

case "$target_dir" in
  "~") target_dir=$HOME ;;
  "~/"*) target_dir=$HOME/${target_dir#\~/} ;;
esac

target_dir=$(realpath -m "$target_dir")
bare_dir=$target_dir/.bare
worktree_dir=$target_dir/worktree1

if [ -e "$target_dir" ] && [ -n "$(ls -A "$target_dir")" ]; then
  printf 'Error: target directory exists and is not empty: %s\n' "$target_dir" >&2
  exit 66
fi

mkdir -p "$target_dir"

git clone --bare "$repo_url" "$bare_dir"
printf 'gitdir: ./.bare\n' > "$target_dir/.git"
git --git-dir="$bare_dir" config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
git --git-dir="$bare_dir" fetch origin
git --git-dir="$bare_dir" worktree add -b worktree1 "$worktree_dir" HEAD

printf 'Bare repository: %s\n' "$bare_dir"
printf 'Initial worktree: %s\n' "$worktree_dir"
