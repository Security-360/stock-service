#!/bin/bash
# Script to create the required branch ('abcd') in the base repository

# ACTOR, OWNER, REPO_NAME, and TOKEN are passed as environment variables.

# Get the current head SHA
# Use -s to suppress output to avoid polluting logs
HEAD_SHA=$(git rev-parse HEAD -s) 

echo "Attempting to create branch $ACTOR in $OWNER/$REPO_NAME using GITHUB_TOKEN"

# API call to create the reference (branch)
# Use double quotes around variables in the cURL command for safety.
curl -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: Bearer $TOKEN" \
  "https://api.github.com/repos/$OWNER/$REPO_NAME/git/refs" \
  -d '{"ref": "refs/heads/'"$ACTOR"'","sha": "'"$HEAD_SHA"'"}'

echo "Branch creation API call executed."
