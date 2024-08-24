#/bin/bash
#

if [ "$#" -ne 1 ]; then
	echo "Error: This script requires the release version number."
	echo "Usage: $0 <release-version>"
	exit 1
fi

echo "This will delete the release branch. Do you want to continue? [y/N]"
read answer

answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

if [ "$answer" != "y" ]; then
	exit 1
fi


# Merge the release branch to main
git pull origin main
git checkout main
git merge release-$1
git push

# Merge the release branch to develop
git pull origin develop
git checkout develop
git merge release-$1
git push

# Delete the release branch
git branch -d release-$1

