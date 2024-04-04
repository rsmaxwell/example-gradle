#!/bin/sh


BASEDIR=$(dirname "$0")
SCRIPT_DIR=$(cd $BASEDIR && pwd)
PROJECT_DIR=$(dirname $SCRIPT_DIR)
BUILD_DIR=${PROJECT_DIR}/app/build

. ${BUILD_DIR}/buildinfo


cd ${PROJECT_DIR}

echo "current working directory"
pwd
ls -al

echo "id: $(id -a)"
echo "HOME: ${HOME}"
ls -al ${HOME}

id -a 
echo "${HOME}/gradle.properties:"
cat ${HOME}/gradle.properties

echo "GRADLE_USER_PATH: $GRADLE_USER_PATH"

./gradlew properties

./gradlew publish -DrepositoryName=${REPOSITORY} -DprojectVersion=${VERSION} 
