#!/bin/bash
cd docs
docker run --rm \
  --volume="$PWD:/srv/jekyll:Z" \
  --network host \
  jekyll/jekyll \
  jekyll serve
