#! /bin/bash
#
# deploy.sh
# Copyright (C) 2021 edgardleal <edgardleal@MacBook-Air-de-Edgard.local>
#
# Distributed under terms of the MIT license.
#

if [ -z "$ENV" ]; then
  echo "ENV environment variable is empty"
  echo "Use a value for ENV variable. egg: dev"
  exit 1
fi

declare env=""

if [ "$BRANCH" =~ "develop" ]; then
  env="dev"
fi

if [ "$BRANCH" =~ "main" ]; then
  env="prd"
fi
if [ "$BRANCH" =~ "master" ]; then
  env="prd"
fi

if [ -z "$env" ]; then
  exit 0
fi

function deploy()
{
  local prev_dir="$(pwd)"
  cd "$1"
  npm install
  ./node_modules/serverless/bin/serverless.js deploy --stage "$ENV"
  cd "$prev_dir"
}

echo "$PROJECT_LIST" | tr ',' '\n' | xargs -L 1 deploy 
