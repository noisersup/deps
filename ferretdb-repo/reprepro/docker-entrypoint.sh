#!/usr/bin/env bash
set -e

rm -rf /srv/repos
cp -r /tmp/repos /srv/

# TODO ssh gpg socket setup
#echo "remote gpg socket: $( gpgconf --list-dir agent-socket )"

# TODO
# should we take deb packages as inputs in mounted dir and pull them every time container is created, or should the /srv/repos be its own mount?

if [ $( find /var/inputs/keys -maxdepth 1 -type f -name *.gpg| wc -l ) != 0  ]; then
	gpg --allow-secret-key-import --import /var/inputs/keys/*.gpg
    if [ $? -ne 0 ]; then
		echo "Failed to import the key."
		exit 1
	fi
else
	echo "At least a single /var/inputs/keys/*.gpg file must be provided."
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

# TODO get distribution name from distributions file
reprepro includedeb bookworm /var/inputs/pkgs/*/*.deb
if [ $? -ne 0 ]; then
	echo "Failed to import packages"
	exit 1
fi


exec "$@"
