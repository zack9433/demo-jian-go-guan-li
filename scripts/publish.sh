# git config --global user.name "${GH_NAME}"
# git config --global user.email "${GH_EMAIL}"
echo "machine github.com login ${GH_NAME} password ${GH_TOKEN}" > ~/.netrc
GIT_USER="${GH_NAME}" CURRENT_BRANCH=master yarn --cwd ./website publish-gh-pages
yarn travis-deploy-once "yarn release"
