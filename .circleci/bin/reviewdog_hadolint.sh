#!/usr/bin/env bash

set -ex

# Exit code always 0
git ls-files --exclude='Dockerfile*' --ignored | xargs hadolint \
| reviewdog -efm="%f:%l %m" -diff="git diff ${DEFAULT_BRANCH}..HEAD" -reporter=github-pr-review