#!/bin/sh

# Rebase to `tran-nguyen.pro` branch

FORK_BRANCH=tran-nguyen.pro
MASTER_BRANCH=master

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ $CURRENT_BRANCH != $FORK_BRANCH ]; then
	#Ensure that code that isn't part of the prospective commit isn't tested within your pre-commit script. This is missed by many sample pre-commit scripts but is easily acheived with git stash:
	git stash -q --keep-index

	# Checkout to tran-nguyen.pro
	git checkout $FORK_BRANCH
	# Soft reset to master
	git reset $MASTER_BRANCH
	# Commit only CNAME
	git commit CNAME -m 'change CNAME to tran-nguyen.pro'
	
	git reset --hard HEAD
	
	# 
	git checkout $CURRENT_BRANCH

	git stash pop -q
fi