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
sed -i -r '
s/^(floppy:).*/\1one/;
s/^(audio:).*/\1one/;
s/^(video:).*/\1one/;
s/^(cdrom:).*/\1one/;
s/^(plugdev:).*/\1one/;
s/^(power:).*/\1one/;
s/^(netdev:).*/\1one/;
s/^(scanner:).*/\1one/;
s/^(users:).*/\1one/;
s/^(fuse:).*/\1one/;
s/^wheel:.*/\0,one/;
' "$RDIR"/etc/group
mkdir -p "$RDIR"/home/one
cp -r "$RDIR"/etc/skel/* "$RDIR"/etc/skel/.??* "$RDIR"/home/one/ 2>/dev/null

echo 'chown -R 1000:100 home/one' >> "$doinst"
