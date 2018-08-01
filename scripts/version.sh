#!/bin/bash

RELEASE_TAG=$(yarn release --dry-run | grep "next release version is" | sed 's/.* //')

if [ -n "$RELEASE_TAG" ]
then
  yarn version ${RELEASE_TAG}
  yarn --cwd ./website publish-gh-pages
fi
