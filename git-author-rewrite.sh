#!/bin/sh

git filter-branch --env-filter '

OLD_EMAIL="cooper.buckingham@gmail.com"
CORRECT_NAME="CH Buckingham"
CORRECT_EMAIL="cooper.buckingham.dev@gmail.com"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags

echo "THEN DO THIS: git push --force --tags origin 'refs/heads/*'"
