#!/usr/bin/env bash
set -euo pipefail

config_file="${XDG_CONFIG_HOME:-$HOME/.config}/walker/config.toml"

if [ ! -f "$config_file" ]; then
    echo "Error: walker config file not found at $config_file" >&2
    exit 1
fi

if grep -qE '^theme\s*=\s*"noctalia"' "$config_file"; then
    :
elif grep -qE '^theme\s*=' "$config_file"; then
    sed -i -E 's/^theme\s*=.*/theme = "noctalia"/' "$config_file"
else
    [ -s "$config_file" ] && [ -n "$(tail -c1 "$config_file")" ] && echo >>"$config_file"
    echo 'theme = "noctalia"' >>"$config_file"
fi
