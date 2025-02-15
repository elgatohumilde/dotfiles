#!/usr/bin/env sh

mode="$1"

case $mode in
    "region")
        grim -g "$(slurp)" - | swappy -f -
        ;;
    "all")
        grim - | swappy -f -
        ;;
    *)
        echo >&2 "unsupported command \"$mode\""
        echo >&2 "Usage:"
        echo >&2 "screenshot.sh <region|all>"
        exit 1
esac
