#! /bin/bash
#
# tests.sh
# Copyright (C) 2021 edgardleal <edgardleal@MacBook-Air-de-Edgard.local>
#
# Distributed under terms of the MIT license.
#



function run_tests()
{
  local prev_dir="$(pwd)"
  cd "$1"
  npm run test
  cd "$prev_dir"
}

echo "$PROJECT_LIST" | tr ',' '\n' | xargs -L 1 run_tests 
