#!/usr/bin/env bash
_IMAGE_NAME="docker.io/ekgf/stardog"
_IMAGE_VERSION="latest"
_MANUALLY_INCREMENTED_IMAGE_VERSION="7.3.4-java11-preview"

docker build . \
  --iidfile=image.id \
  "--tag=${_IMAGE_NAME}:${_IMAGE_VERSION}" \
  "--tag=${_IMAGE_NAME}:${_MANUALLY_INCREMENTED_IMAGE_VERSION}"
exit $?
