#!/bin/bash
set -ex

baseurl="https://tsomanchi.github.io/f5charts"
to_index=(incubator stable)

curdir=$(basename $(pwd))

if [ $curdir != "f5charts" ]; then
  echo "[ERROR]  Re-index tool expects to be run from repo base directory."
  exit 1
fi

for target in "${to_index[@]}"; do
  helm repo index $target --url $baseurl/$target --merge $target/index.yaml
done
