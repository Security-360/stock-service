#!/bin/bash
# Script to create the required branch ('abcd') in the base repository

# Set runtime variables
ACTOR="${{ github.event.workflow_run.actor.login || github.actor }}"
OWNER="${{ github.repository_owner }}"
REPO_NAME="${{ github.event.workflow_run.repository.name }}"
HEAD_SHA=$(git rev-parse HEAD)

echo "Attempting to create branch $ACTOR in $OWNER/$REPO_NAME using GITHUB_TOKEN"

# API call to create the reference (branch)
curl -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: Bearer ${{ secrets.GITHUB_TOKEN }}" \
  "https://api.github.com/repos/$OWNER/$REPO_NAME/git/refs" \
  -d '{"ref": "refs/heads/'$ACTOR'","sha": "'$HEAD_SHA'"}'

echo "Branch creation API call executed."
