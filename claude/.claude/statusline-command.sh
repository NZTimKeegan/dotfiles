#!/bin/sh
input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# Abbreviate home directory with ~
home="$HOME"
short_cwd=$(echo "$cwd" | sed "s|^$home|~|")

# Get git branch if in a repo
git_branch=$(git -C "$cwd" rev-parse --abbrev-ref HEAD 2>/dev/null)

# Build status parts
status="λ $short_cwd"

if [ -n "$git_branch" ]; then
  status="$status [$git_branch]"
fi

if [ -n "$model" ]; then
  status="$status  $model"
fi

if [ -n "$remaining" ]; then
  remaining_int=$(printf '%.0f' "$remaining")
  status="$status  ctx: ${remaining_int}%"
fi

printf '%s' "$status"
