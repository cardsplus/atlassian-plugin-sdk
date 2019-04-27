#!/bin/bash
set -e
export ATLAS_OPTS="-Dmaven.repo.local=/m2/repository"
env
ls -a -d -1 *
echo "$0 $@"
$@