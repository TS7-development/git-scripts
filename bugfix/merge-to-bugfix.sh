#/bin/bash
#

if [ "$#" -ne 1 ]; then
	echo "Error: This script requires the ticket id."
	echo "Usage: $0 <ticket-id>"
	exit 1
fi

git pull origin bugfix-$1
git checkout bugfix-$1
git merge develop
git push

