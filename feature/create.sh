#/bin/bash
#

if [ "$#" -ne 1 ]; then
	echo "Error: This script requires the feature name."
	echo "Usage: $0 <feature-name>"
	exit 1
fi

git checkout -b feature-$1 develop

