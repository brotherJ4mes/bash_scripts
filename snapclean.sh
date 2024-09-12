#!/bin/bash
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
while read snap rev; do
sudo snap remove "$snap" --revision="$rev"
done
