#! /bin/bash
#
# run_tests.sh
# Copyright (C) 2021 edgardleal <edgardleal@MacBook-Air-de-Edgard.local>
#
# Distributed under terms of the MIT license.
#


declare -r prev_dir="$(pwd)"
cd "$1"
npm run test
cd "$prev_dir"

