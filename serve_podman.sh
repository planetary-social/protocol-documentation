#!/bin/bash
cd docs
podman run --rm \
  --volume="$PWD:/srv/jekyll:Z" \
  --network host \
  docker.io/jekyll/jekyll:4.2.0 \
  jekyll serve
