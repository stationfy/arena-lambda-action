#!/bin/bash
#
# tests.sh
# Copyright (C) 2021 edgardleal <edgardleal@MacBook-Air-de-Edgard.local>
#
# Distributed under terms of the MIT license.
#


declare -r script_dir=$(dirname $0)
echo "$PROJECT_LIST" | tr ',' '\n' | xargs -L 1 "$script_dir/run_tests.sh"
