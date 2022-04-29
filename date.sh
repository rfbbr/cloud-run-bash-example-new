#!/usr/bin/env bash

set -eEuo pipefail

HEAD="$(cat <<EOF
HTTP/1.1 200 OK
Connection: keep-alive\r\n\r\n
EOF
)"

echo -en "$HEAD"
gcloud alpha storage ls --project=business-analytics-hml
date
