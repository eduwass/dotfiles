#!/bin/sh
HASH1=${1}
HOWMANYCOMMITS=${2:-1} # if there's a second param it takes it, else defaults to "1"
HASH2=$(git rev-parse $HASH1~$HOWMANYCOMMITS)
DATE="$(date "+%m_%d_%Y_%H%M")"
FILENAME="$HOME/Sites/zips/deploy-$DATE.zip"
git archive -o $FILENAME $HASH2 $(git diff --diff-filter=ACMRTUXB --name-only $HASH1 $HASH2)