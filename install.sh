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

echo "$PROJECT_LIST" | tr ',' '\n' | xargs -L 1 ./npm_install.sh

cd "$execution_dir"
