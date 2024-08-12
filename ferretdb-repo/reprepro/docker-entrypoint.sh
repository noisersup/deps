#!/usr/bin/env bash
set -e

cp -r /tmp/repos /srv/

# TODO ssh gpg socket setup
#echo "remote gpg socket: $( gpgconf --list-dir agent-socket )"

if [ $( find /var/inputs/ -maxdepth 1 -type f -name *.gpg| wc -l ) != 0  ]; then
	gpg --allow-secret-key-import --import /var/inputs/*.gpg
    if [ $? -ne 0 ]; then
		echo "Failed to import the key."
		exit 1
	fi
else
	echo "/var/inputs/*.gpg must be provided. Please use task gen-key."
	exit 1
fi

fingerprints=$( gpg --list-secret-key | grep -oP '(?<=\s)[A-F0-9]{40}$' )
echo "SignWith: $( echo $fingerprints | paste -sd' ' -)" >> /srv/repos/apt/debian/conf/distributions

names=$(gpg --list-keys | sed -n 's/uid\s*\[[a-zA-Z ]*\] \([a-zA-Z_-]*\)$/\1/p')

rm -rf /srv/repos/apt/static/
mkdir -p /srv/repos/apt/static/

for name in $names; do
	gpg --armor --output /srv/repos/apt/static/$name.gpg.key --export-options export-minimal --export $name
done

exec "$@"
