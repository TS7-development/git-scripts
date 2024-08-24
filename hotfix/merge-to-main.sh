#/bin/bash
#

if [ "$#" -ne 1 ]; then
	echo "Error: This script requires the ticket id."
	echo "Usage: $0 <ticket-id>"
	exit 1
fi

echo "This will delete the hotfix branch. Do you want to continue? [y/N]"
read answer

answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

if [ "$answer" != "y" ]; then
	exit 1
fi

# Merge to main
git pull origin main
git checkout main
git merge hotfix-$1
git push

# Merge to develop
git pull origin develop
git checkout develop
git merge hotfix-$1
git push

# Delete the hotfix branch
git branch -d hotfix-$1
