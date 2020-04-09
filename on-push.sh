#!/usr/bin/env bash

cd /usr/src/app

if [[ ! -d .git ]]; then
    git clone --depth=1 "${REPO_URL}" .
fi

git fetch --no-tags --depth=1 origin master
git reset --hard origin/master

yarn
