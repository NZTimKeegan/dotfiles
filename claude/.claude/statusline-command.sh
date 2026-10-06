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

# Line 1: folder and branch
line1="λ $short_cwd"

if [ -n "$git_branch" ]; then
  line1="$line1 | $git_branch"
fi

# Line 2: model and context
line2="$model"

if [ -n "$remaining" ]; then
  remaining_int=$(printf '%.0f' "$remaining")
  line2="${line2:+$line2 | }ctx: ${remaining_int}%"
fi

printf '%s' "$line1"
if [ -n "$line2" ]; then
  printf '\n%s' "$line2"
fi
