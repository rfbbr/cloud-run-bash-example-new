#!/usr/bin/env bash

set -eEuo pipefail

HEAD="$(cat <<EOF
HTTP/1.1 200 OK
Connection: keep-alive\r\n\r\n
EOF
)"

echo -en "$HEAD"
#date
echo "bucket"
gcloud alpha storage ls --project=sem-servidor-348402 >> bucket
echo "bucket"
echo $bucket
