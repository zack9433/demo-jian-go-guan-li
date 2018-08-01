#!/bin/bash

RELEASE_TAG=$(npm run release --dry-run | grep "next release version is" | sed 's/.* //')

if [ -n "$RELEASE_TAG" ]
then
  npm run version ${RELEASE_TAG} --prefix ./website
  npm run publish-gh-pages --prefix ./website
fi
