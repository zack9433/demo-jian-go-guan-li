#!/bin/bash

RELEASE_TAG=$(yarn dotenv yarn release --dry-run | grep "next release version is" | sed 's/.* //')

setup_git() {
  git config --global user.name "${GH_NAME}"
  git config --global user.email "${GH_EMAIL}"
}

commit_version_file() {
  # git checkout -b ${TRAVIS_BRANCH}
  git add .
  git commit --message "ci(travis): build #$TRAVIS_BUILD_NUMBER"
}

upload_file() {
  # git remote add ${TRAVIS_BRANCH} https://${GH_TOKEN}@github.com/zack9433/demo-jian-go-guan-li.git > /dev/null 2>&1
  git push --quiet
  # git push --quiet --set-upstream ${TRAVIS_BRANCH} ${TRAVIS_BRANCH}
}


if [ -n "$RELEASE_TAG" ]
then
  echo "Prepare to release version ${RELEASE_TAG}"
  yarn --cwd ./website run version ${RELEASE_TAG}
  setup_git
  commit_version_file
  upload_files
  # GIT_USER="${GH_NAME}" CURRENT_BRANCH=master yarn --cwd ./website publish-gh-pages
fi
