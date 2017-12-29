#!/bin/bash
set -e # Exit with nonzero exit code if anything fails

SOURCE_BRANCH="master"
TARGET_BRANCH="gh-pages"

# Pull requests and commits to other branches shouldn't try to deploy, just build to verify
if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "$SOURCE_BRANCH" ]; then
    echo "Skipping deploy; just doing a build."
    ./build.sh
    exit 0
fi

# Save some useful information
REPO=`git config remote.origin.url`
SSH_REPO=${REPO/https:\/\/github.com\//git@github.com:}
GIT_COMMIT_SHA=`git rev-parse --verify HEAD`

# Clone the existing gh-pages for this repo into ${TARGET_BRANCH}/
# Create a new empty branch if gh-pages doesn't exist yet (should only happen on first deply)
git clone $REPO ${TARGET_BRANCH}
cd ${TARGET_BRANCH}
git checkout $TARGET_BRANCH || git checkout --orphan $TARGET_BRANCH
rm -Rf * .travis*
cd ..

# Now let's go have some fun with the cloned repo
cd ${TARGET_BRANCH}
git config user.name "Travis CI"
git config user.email "$COMMIT_AUTHOR_EMAIL"

# Commit the "changes", i.e. the new version.
# The delta will show diffs between new and old versions.
cp -Rf ../public/* .
git add --all .
git commit -m "Deploy to GitHub Pages: ${GIT_COMMIT_SHA}"

# Get the deploy key by using Travis's stored variables to decrypt deploy_key.enc
ENCRYPTED_KEY_VAR="encrypted_${ENCRYPTION_LABEL}_key"
ENCRYPTED_IV_VAR="encrypted_${ENCRYPTION_LABEL}_iv"
ENCRYPTED_KEY=${!ENCRYPTED_KEY_VAR}
ENCRYPTED_IV=${!ENCRYPTED_IV_VAR}
openssl aes-256-cbc -K $ENCRYPTED_KEY -iv $ENCRYPTED_IV -in ../${DEPLOY_KEY}.enc -out ../${DEPLOY_KEY} -d
chmod 600 ../$DEPLOY_KEY
eval `ssh-agent -s`
ssh-add ../$DEPLOY_KEY

# Now that we're all set up, we can push.
git push $SSH_REPO $TARGET_BRANCH
