#!/bin/sh
cd "$(dirname "$0")"
HDIR="$(readlink -f "$PWD"/../..)"
RDIR="$HDIR"/root
doinst="$HDIR"/doinst
modtxt="$HDIR"/MODIFICATIONS

USERSETTINGSETC="$(readlink -f "$(ls -1 "$HDIR"/../PKGS/etc-[0-9]*.txz 2>/dev/null)")"
if [ -n "$USERSETTINGSETC" ]; then
  tar -C "$RDIR" -xf "$USERSETTINGSETC" etc/skel
else
  echo "Cannot add $0 because package etc is missing in PKGS." >&2
  exit 1
fi
