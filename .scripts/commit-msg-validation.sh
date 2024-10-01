#!/bin/bash

# Get the latest commit message
commit_message=$(git log -1 --pretty=%B)

# Validate the commit message format
echo "$commit_message";
if ! echo "$commit_message" | grep -qE "^(feat|fix|docs|style|refactor|perf|test|chore): "; then
    echo "Error: Commit message must follow the format: <type>: <description>"
    exit 1
fi

# If validation passes
echo "Commit message is valid."
exit 0
