#!/bin/bash
cd docs
docker run --rm \
  --volume="$PWD:/srv/jekyll:Z" \
  --network host \
  jekyll/jekyll:4.2.0 \
  jekyll serve
