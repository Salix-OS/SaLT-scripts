#!/bin/sh
cd "$(dirname "$0")"
HDIR="$(readlink -f "$PWD"/../..)"
echo "$HDIR"
RDIR="$HDIR"/root
doinst="$HDIR"/doinst
modtxt="$HDIR"/MODIFICATIONS

cat <<EOF >> "$modtxt"
hostname
--------
"- hostname to salixlive.salixos.org (resolved to localhost)"


EOF

cat <<EOF > "$RDIR"/etc/HOSTNAME
salixlive.salixos.org

EOF

cat <<EOF > "$RDIR"/etc/hosts
#
# hosts		This file describes a number of hostname-to-address
#		mappings for the TCP/IP subsystem.  It is mostly
#		used at boot time, when no name servers are running.
#		On small systems, this file can be used instead of a
#		"named" name server.  Just add the names, addresses
#		and any aliases to this file...
#
# By the way, Arnt Gulbrandsen <agulbra@nvg.unit.no> says that 127.0.0.1
# should NEVER be named with the name of the machine.  It causes problems
# for some (stupid) programs, irc and reputedly talk. :^)
#

# For loopbacking.
127.0.0.1	localhost
# This next entry is technically wrong, but good enough to get TCP/IP apps
# to quit complaining that they can't verify the hostname on a loopback-only
# Linux box.
127.0.0.1	salixlive.salixos.org salixlive

# End of hosts.

EOF
