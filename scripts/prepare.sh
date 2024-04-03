#!/bin/sh


if [ -z "${BUILD_ID}" ]; then
    BUILD_ID="(none)"
    VERSION="0.0.1-SNAPSHOT"
    REPOSITORY=snapshots
    REPOSITORYID=snapshots
else
    VERSION="0.0.1.$((${BUILD_ID}))"
    REPOSITORY=releases
    REPOSITORYID=releases
fi


BASEDIR=$(dirname "$0")
SCRIPT_DIR=$(cd $BASEDIR && pwd)
PROJECT_DIR=$(dirname $SCRIPT_DIR)
SOURCE_DIR=${PROJECT_DIR}/app/src
BUILD_DIR=${PROJECT_DIR}/app/build
TEMPLATES_DIR=${PROJECT_DIR}/templates



mkdir -p ${BUILD_DIR}
cd ${BUILD_DIR}


cat > buildinfo <<EOL
VERSION="${VERSION}"
REPOSITORY="${REPOSITORY}"
EOL

pwd
ls -al 
cat buildinfo



TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S')"
GIT_COMMIT="${GIT_COMMIT:-(none)}"
GIT_BRANCH="${GIT_BRANCH:-(none)}"
GIT_URL="${GIT_URL:-(none)}"

export BUILD_ID
export VERSION
export TIMESTAMP
export GIT_COMMIT
export GIT_BRANCH
export GIT_URL

tags='$VERSION,$BUILD_ID,$TIMESTAMP,$GIT_COMMIT,$GIT_BRANCH,$GIT_URL'



cd ${TEMPLATES_DIR}

find . -type f | while read filename; do
    echo "Writing ${filename}"
    envsubst "${tags}" < ${filename} > ${SOURCE_DIR}/${filename}
done
