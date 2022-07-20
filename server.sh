#!/usr/bin/env sh
#
# Copyright (c) Microsoft Corporation. All rights reserved.
#

case "$1" in
        --inspect*) INSPECT="$1"; shift;;
esac

ROOT="$(dirname "$0")"
ARGUMENTS="$@"
"$ROOT/node" ${INSPECT:-} "$ROOT/out/server-main.js" --compatibility=1.63 ${ARGUMENTS%--enable-remote-auto-shutdown}