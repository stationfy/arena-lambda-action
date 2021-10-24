#! /bin/bash
#
# run_deploy.sh
# Copyright (C) 2021 edgardleal <edgardleal@MacBook-Air-de-Edgard.local>
#
# Distributed under terms of the MIT license.
#


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

declare -r prev_dir="$(pwd)"
cd "$1"
./node_modules/serverless/bin/serverless.js deploy --stage "$ENV"
cd "$prev_dir"
