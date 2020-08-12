#!/usr/bin/env bash

./localbuild.sh || exit $?

local_workdir="$(pwd)/workdir"
stardog_license="$(pwd)/stardog-license-key.bin"

if [[ ! -f "${stardog_license}" ]] ; then
  echo "ERROR: Could not find Stardog license file: ${stardog_license}"
  exit 1
fi

HOST_PORT=5820
CONT_PORT=5820

docker run \
  --interactive --tty --rm \
  --mount type=bind,source=${stardog_license},target=/var/opt/stardog/stardog-license-key.bin \
  --mount type=bind,source=${local_workdir},target=/var/opt/stardog \
  --publish ${HOST_PORT}:${CONT_PORT} \
  --workdir="/var/opt/stardog" \
  "$(< image.id)" $@
exit $?
