#/bin/bash
#

if [ "$#" -ne 1 ]; then
	echo "Error: This script requires the release version number."
	echo "Usage: $0 <release-version>"
	exit 1
fi

git checkout -b release-$1 develop

