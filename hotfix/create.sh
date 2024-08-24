#/bin/bash
#

if [ "$#" -ne 1 ]; then
	echo "Error: This script requires the ticket id."
	echo "Usage: $0 <ticket-id>"
	exit 1
fi

git checkout -b hotfix-$1 main

