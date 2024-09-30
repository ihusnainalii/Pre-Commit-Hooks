#!/bin/bash
branch="$(git rev-parse --abbrev-ref HEAD)"

echo "Current Branch: $branch"

# Restrict branches from direct push
if [ "$branch" = "main" ] || [ "$branch" = "uat" ]; then
  echo "You can't commit directly to $branch"
  exit 1
fi

echo "The branch is valid, moving on..."
exit 0
