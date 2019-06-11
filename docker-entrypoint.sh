#!/bin/sh

set -ex;

exec /usr/bin/java \
    -jar \
    /test/docker_test.jar \
    "$@"
