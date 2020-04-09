#!/usr/bin/env bash

docker build -t images.lit.plus/webeng-builder:latest .
docker build -t images.lit.plus/webeng-nginx:latest ./nginx
