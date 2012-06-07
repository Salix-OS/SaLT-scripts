#!/bin/sh
cd "$(dirname "$0")"
HDIR="$(readlink -f "$PWD"/../..)"
echo "$HDIR"
RDIR="$HDIR"/root
doinst="$HDIR"/doinst
modtxt="$HDIR"/MODIFICATIONS

cat <<EOF >> "$modtxt"
root-password
-------------
- root user with password 'live'


EOF
sed -i 's/^root:.*/root:$1$R5js9s.7$vv2tt94NF36FLz9xqHP2V.:14485:0:::::/' "$RDIR"/etc/shadow
