#!/bin/bash

file="$1"
w="$2"
h="$3"
x="$4"
y="$5"

if file --mime-type "$file" | grep -qE 'image/'; then
    kitten icat --stdin no --transfer-mode memory --place "${w}x${h}@${x}x${y}" "$1" </dev/null >/dev/tty
    exit 1
fi

bat --style=plain --color=always --line-range=:500 "$file" 2>/dev/null || cat "$file"
