#!/bin/bash

if [ ! -z "${TRAVIS_TAG}" ]; then
    # Setup deploy key
    rm -rf ~/.ssh
    mkdir ~/.ssh
    echo -n $bower_id_rsa_{00..30} >> ~/.ssh/id_rsa_base64
    base64 --decode --ignore-garbage ~/.ssh/id_rsa_base64 > ~/.ssh/id_rsa
    chmod 600 ~/.ssh/id_rsa
    echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

    # Create vars with the latest commit author name and email
    GIT_NAME=`git show --format="%an" | head -n 1`
    GIT_MAIL=`git show --format="%ae" | head -n 1`

    # Clone repo
    git clone git@github.com:injoin/bower-frontkit.git

    # Unzip the package into the git repo, copy the bower.json file
    unzip frontkit.dev.zip -d bower-frontkit
    cp bower.json bower-frontkit/bower.json

    # cd into the repo and configure git
    cd bower-frontkit
    git config user.name "${GIT_NAME}"
    git config user.email "${GIT_MAIL}"

    # Commit, tag and push
    git add .
    git commit -m "chore(release): release v${TRAVIS_TAG}"
    git tag "${TRAVIS_TAG}"
    git push origin master --tags

    # Back to the project root
    cd ..
fi