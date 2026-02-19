#!/bin/sh


BASEDIR=$(dirname "$0")
SCRIPT_DIR=$(cd $BASEDIR && pwd)
PROJECT_DIR=$(dirname $SCRIPT_DIR)
BUILD_DIR=${PROJECT_DIR}/app/build

. ${BUILD_DIR}/buildinfo


cd ${PROJECT_DIR}


set -x
echo "whoami=$(whoami)"
echo "HOME=$HOME"
echo "GRADLE_USER_HOME=${GRADLE_USER_HOME:-<unset>}"
ls -al "$HOME/.gradle" || true
test -f "$HOME/.gradle/gradle.properties" && cat "$HOME/.gradle/gradle.properties" || echo "no gradle.properties in HOME"
set +x

./gradlew publish --no-daemon --info \
    -PrepositoryName="${REPOSITORY}" \
    -PprojectVersion="${VERSION}" \
    -PbuildID="${BUILD_ID}"
