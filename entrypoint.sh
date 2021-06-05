#!/bin/bash

set -e
set -x

if [[ -z "$GITHUB_WORKSPACE" ]]; then
  echo "Set the GITHUB_WORKSPACE env variable."
  exit 1
fi

if [[ -z "$GITHUB_REPOSITORY" ]]; then
  echo "Set the GITHUB_REPOSITORY env variable."
  exit 1
fi

setup_git() {
  repo=$1
  branch=$2
  git config --global user.email "bot@github.com"
  git config --global user.name "Github Actions"
  git init
  echo "Starting to clone blog repository"
  git remote add origin https://"${PUSH_TOKEN}"@github.com/"${repo}" > /dev/null 2>&1
  git pull origin "${branch}"
  echo "Cloning is done"
  ls -l
}

commit_website_files() {
  git add .
  git commit -am "Github Action Build ${GITHUB_SHA}"
}

upload_files() {
  git push --quiet --set-upstream origin master
}

echo "Beginning publishing workflow"
repo=$1
branch=${2:-main}
if [ -z "${repo}" ]; then
    echo "Repo must be defined."
    exit 1
fi
echo "Using repository ${repo} and branch ${branch} to push to"
mkdir /opt/publish && cd /opt/publish
blog_path="$GITHUB_WORKSPACE/.blog"
echo "Blog is located at: ${blog_path}"
ls -l "${blog_path}"
echo "Setting up git"
setup_git "${repo}" "${branch}"
cp -R "${blog_path}"/* .
echo "Copied over generated content from blog path. Committing."
commit_website_files
echo "Committed. Pushing."
upload_files
echo "All done."
exit 0
