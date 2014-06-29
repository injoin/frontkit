#!/bin/sh

if [ ! -z "${TRAVIS_TAG}" ]; then
    # Setup deploy key
    rm -rf ~/.ssh/
    echo -n $bower_id_rsa_{00..30} >> ~/.ssh/id_rsa_base64
    base64 --decode --ignore-garbage ~/.ssh/id_rsa_base64 > ~/.ssh/id_rsa
    chmod 600 ~/.ssh/id_rsa
    echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

    # Create vars with the latest commit author name and email
    GIT_NAME = `git show --format="%an" master | head -n 1`
    GIT_MAIL = `git show --format="%ae" master | head -n 1`

    # Configure git and clone repo
    git config user.name "${GIT_NAME}"
    git config user.email "${GIT_MAIL}"
    git clone git@github.com:injoin/bower-frontkit.git

    # Unzip the package into the git repo, copy the bower.json file and cd into it
    unzip frontkit.dev.zip -d bower-frontkit
    cp bower.json bower-frontkit/bower.json
    cd bower-frontkit

    # Commit, tag and push
    git commit -am "chore(release): release v${TRAVIS_TAG}"
    git tag "${TRAVIS_TAG}"
    git push origin master --tags

    # Back to the project root
    cd ..
fi