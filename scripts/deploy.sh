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

echo "BUILD_DIR: ${BUILD_DIR}"
ls -al ${BUILD_DIR}

echo "id: $(id -a)"
echo "HOME: ${HOME}"
ls -al ${HOME}

id -a 
touch ${HOME}/fred.txt
echo "Hello World!" > ${HOME}/bloggs.txt

ls -al ${HOME}


./gradlew publish -DrepositoryName=${REPOSITORY} -DprojectVersion=${VERSION} 
