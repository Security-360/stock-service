#!/bin/bash
# Script to create the required branch ('abcd') in the base repository

# Variables are passed as environment variables by package.json
# ACTOR, OWNER, REPO_NAME, and TOKEN are now available

# Get the current head SHA
HEAD_SHA=$(git rev-parse HEAD)

echo "Attempting to create branch $ACTOR in $OWNER/$REPO_NAME using GITHUB_TOKEN"

# API call to create the reference (branch)
curl -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.github.com/repos/$OWNER/$REPO_NAME/git/refs" \
  -d '{"ref": "refs/heads/'$ACTOR'","sha": "'$HEAD_SHA'"}'

echo "Branch creation API call executed."
