#!/bin/bash

if [ ! -z "${TRAVIS_TAG}" ]; then
    # Setup deploy key
    rm -rf ~/.ssh
    mkdir ~/.ssh
    echo -n $self_id_rsa_{00..30} >> ~/.ssh/id_rsa_base64
    base64 --decode --ignore-garbage ~/.ssh/id_rsa_base64 > ~/.ssh/id_rsa
    chmod 600 ~/.ssh/id_rsa
    echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

    # Create vars with the latest commit author name and email
    GIT_NAME=`git show --format="%an" | head -n 1`
    GIT_MAIL=`git show --format="%ae" | head -n 1`

    # Configure git
    git config user.name "${GIT_NAME}"
    git config user.email "${GIT_MAIL}"

    # Drop modifications
    git reset --hard
    git clean -f

    # Checkout gh-pages and merge changes from master
    git fetch origin gh-pages:gh-pages
    git checkout -f gh-pages
    git merge master

    # Update references to a few compiled files
    grunt docs deps bower-rawgit dist-bower

    # Force add ignored stuff
    git add -f assets/styles/docs.css
    git add -f assets/meta/icons-list.json
    git add -f docs/
    git add -f index.html

    # Commit and push stuff
    git commit -m "chore(release): docs release v${TRAVIS_TAG}"
    git remote set-url origin git@github.com:injoin/frontkit.git
    git push origin gh-pages
fi