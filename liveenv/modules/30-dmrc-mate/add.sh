#!/bin/sh
cd "$(dirname "$0")"
HDIR="$(readlink -f "$PWD"/../..)"
RDIR="$HDIR"/root
doinst="$HDIR"/doinst
modtxt="$HDIR"/MODIFICATIONS

cat <<EOF >> "$modtxt"
dmrc-mate
---------
- default session for user 'one' is Maté


EOF

cat <<EOF > "$RDIR"/home/one/.dmrc
[Desktop]
Session=mate

EOF
