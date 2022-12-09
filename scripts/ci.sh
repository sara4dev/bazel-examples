#!/usr/bin/env bash

# Go to the root of the repo
cd "$(git rev-parse --show-toplevel)"

# Get a list of the current files in package form by querying Bazel.
files=()
for file in $(git diff --name-only); do
  files+=($(bazel query $file))
  echo $(bazel query $file)
done


# Query for the associated buildables
buildables=$(bazel query \
    --keep_going \
    "kind(.*_binary, rdeps(//..., set(${files[*]})))")

# Build the targets only for the chnaged files
if [[ ! -z $buildables ]]; then
  echo "Building binaries"
  bazel build $buildables
fi
