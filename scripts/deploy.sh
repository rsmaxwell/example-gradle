#!/bin/sh


BASEDIR=$(dirname "$0")
SCRIPT_DIR=$(cd $BASEDIR && pwd)
PROJECT_DIR=$(dirname $SCRIPT_DIR)
BUILD_DIR=${PROJECT_DIR}/app/build

. ${BUILD_DIR}/buildinfo


cd ${PROJECT_DIR}


set -x
whoami
echo "home: $HOME"
ls -al /home/gradle/.gradle
cat /home/gradle/.gradle/gradle.properties
set +x

./gradlew publish --no-daemon --info \
    -PrepositoryName="${REPOSITORY}" \
    -PprojectVersion="${VERSION}" \
    -PbuildID="${BUILD_ID}"
