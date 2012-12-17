#!/bin/sh

#Ensure that code that isn't part of the prospective commit isn't tested within your pre-commit script. This is missed by many sample pre-commit scripts but is easily acheived with git stash:
git stash -q --keep-index

# Keep current branch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

for branch in $(git for-each-ref --format='%(refname:short)' refs/heads/); do
	git checkout $branch
	# Force update, be careful if in collaboration
	git push -f
done

# Switch back to current branch
git checkout $CURRENT_BRANCH

# Apply stash
git stash pop -q
