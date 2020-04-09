#!/usr/bin/env bash

ssh-keyscan github.com >> ssh_known_hosts
ssh-keygen -lf ssh_known_hosts

echo "Please check against https://help.github.com/en/github/authenticating-to-github/githubs-ssh-key-fingerprints"
