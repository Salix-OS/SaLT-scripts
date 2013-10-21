#!/bin/sh
startdir="$1"
[ -n "$startdir" ] && [ -d "$startdir" ] || exit 1
cd "$(dirname "$0")"
HDIR="$startdir/liveenv"
PKGSDIR="$startdir/PKGS"
RDIR="$HDIR"/root
doinst="$HDIR"/doinst
modtxt="$HDIR"/MODIFICATIONS

cat <<EOF >> "$modtxt"
root-password
-------------
- root user with password 'live'


EOF
rootpwd=$(python -c "
import crypt
import string
import random
print crypt.crypt('live', '\$1\$'+''.join([random.choice(string.letters + string.digits + './') for c in range(8)])+'\$')
")
sed -i "/^root:/ s,^root::,root:$rootpwd:," "$RDIR"/etc/shadow
