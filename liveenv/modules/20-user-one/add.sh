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
user-one
-------------
- user 'one' already created with password 'one'
- user 'one' added to the following groups:
  * floppy
  * audio
  * video
  * cdrom
  * plugdev
  * power
  * netdev
  * scanner
  * users
  * fuse
  * wheel (so is sudoer)


EOF

echo 'one:x:1000:100::/home/one:/bin/bash' >> "$RDIR"/etc/passwd
echo 'one::13686:0:99999:7:::' >> "$RDIR"/etc/shadow
sed -i 's/^floppy:.*/\0,one/; s/^audio:.*/\0,one/; s/^video:.*/\0,one/; s/^cdrom:.*/\0,one/; s/^plugdev:.*/\0,one/; s/^power:.*/\0,one/; s/^netdev:.*/\0,one/; s/^scanner:.*/\0,one/; s/^users:.*/\0one/; s/^fuse:.*/\0one/; s/^wheel:.*/\0one/;' "$RDIR"/etc/group
mkdir -p "$RDIR"/home/one
cp -r "$RDIR"/etc/skel/* "$RDIR"/etc/skel/.??* "$RDIR"/home/one/ 2>/dev/null

echo 'chown -R 1000:100 home/one' >> "$doinst"
