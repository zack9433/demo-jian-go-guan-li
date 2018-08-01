#!/bin/bash

RELEASE_TAG=$(yarn release --dry-run | grep "next release version is" | sed 's/.* //')

if [ -n "$RELEASE_TAG" ]
then
  echo "Prepare to release version ${RELEASE_TAG}"
  yarn --cwd ./website run version ${RELEASE_TAG}
  GIT_USER="${GH_NAME}" CURRENT_BRANCH=master yarn --cwd ./website publish-gh-pages
fi
