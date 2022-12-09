# bazel-examples

This repo is to play with bazel & learn.


## Bazel Cheat Sheets

* `bazel info repository_cache` - shows the bazel cache location
* `bazel clean --explunge` - removes all the `bazel-*/` directories created by bazel
* `bazel run $(bazel query "kind(buildifier, //...)")` - runs all the `buildifier` targets in the workspace
