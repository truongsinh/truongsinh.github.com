#!/bin/sh

# Stash unstaged changes before running tests

#Ensure that code that isn't part of the prospective commit isn't tested within your pre-commit script. This is missed by many sample pre-commit scripts but is easily acheived with git stash:
git stash -q --keep-index
echo "stahed"
# Test prospective commit
#...

git stash pop -q
echo "unstashed"
