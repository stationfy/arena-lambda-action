#! /bin/bash
#
# install.sh
# Copyright (C) 2021 edgardleal <edgardleal@MacBook-Air-de-Edgard.local>
#
# Distributed under terms of the MIT license.
#

declare execution_dir=$(pwd)

declare script_dir=$(dirname $0)

cd "$script_dir"

function npm_install()
{
  local prev_dir="$(pwd)"
  cd "$1"
  npm install
  cd "$prev_dir"
}

echo "$PROJECT_LIST" | tr ',' '\n' | xargs -L 1 npm_install 

cd "$execution_dir"
