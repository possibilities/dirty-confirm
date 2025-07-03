#!/usr/bin/env bash

# Check if in a git repository
if ! git rev-parse --git-dir &> /dev/null; then
    echo "Warning: Not in a git repository" >&2
    read -p "Continue anyway? (y/N) " -n 1 -r
    echo >&2
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
    exit 0
fi

# Check if repository is dirty
if [[ -n $(git status --porcelain) ]]; then
    echo "Warning: Git repository has uncommitted changes" >&2
    read -p "Continue anyway? (y/N) " -n 1 -r
    echo >&2
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

exit 0