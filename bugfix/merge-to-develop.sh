#/bin/bash
#

if [ "$#" -ne 1 ]; then
	echo "Error: This script requires the ticket id."
	echo "Usage: $0 <ticket-id>"
	exit 1
fi

echo "This will delete the bugfix branch. Do you want to continue? [y/N]"
read answer

answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

if [ "$answer" != "y" ]; then
	exit 1
fi

# Merge the bugfix branch to develop
git pull origin develop
git checkout develop
git merge bugfix-$1
git push

# Delete the bugfix branch
git branch -d bugfix-$1

