#/bin/bash
#

if [ "$#" -ne 1 ]; then
	echo "Error: This script requires the feature name."
	echo "Usage: $0 <feature-name>"
	exit 1
fi

echo "This will delete the feature branch. Do you want to continue? [y/N]"
read answer

answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

if [ "$answer" != "y" ]; then
	exit 1
fi

# Merge the feature branch to develop
git pull origin develop
git checkout develop
git merge feature-$1
git push

# Delete the feature branch
git branch -d feature-$1

