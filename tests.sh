#!/bin/bash
#
# tests.sh
# Copyright (C) 2021 edgardleal <edgardleal@MacBook-Air-de-Edgard.local>
#
# Distributed under terms of the MIT license.
#



echo "$PROJECT_LIST" | tr ',' '\n' | xargs -L 1 ./run_tests.sh
