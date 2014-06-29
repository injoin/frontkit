#!/bin/sh

if [ ! -z "${TRAVIS_TAG}" ]; then
    # Setup deploy key
    rm -rf ~/.ssh/
    echo -n $self_id_rsa_{00..30} >> ~/.ssh/id_rsa_base64
    base64 --decode --ignore-garbage ~/.ssh/id_rsa_base64 > ~/.ssh/id_rsa
    chmod 600 ~/.ssh/id_rsa
    echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

    # Checkout gh-pages and merge changes from master
    git checkout gh-pages
    git merge master

    # Update references to a few compiled files
    grunt docs deps bower-rawgit dist-bower

    # Force add ignored stuff
    git add -f assets/styles/docs.css
    git add -f docs/
    git add -f index.html

    # Commit and push stuff
    git commit -m "chore(release): docs release v${TRAVIS_TAG}"
    git push origin gh-pages
fi