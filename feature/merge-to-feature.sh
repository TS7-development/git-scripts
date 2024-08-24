#/bin/bash
#

if [ "$#" -ne 1 ]; then
	echo "Error: This script requires the feature name."
	echo "Usage: $0 <feature-name>"
	exit 1
fi

git pull origin feature-$1
git checkout feature-$1
git merge develop
git push

