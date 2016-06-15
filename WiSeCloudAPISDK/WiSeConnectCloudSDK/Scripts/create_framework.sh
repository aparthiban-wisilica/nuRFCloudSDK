#!/bin/sh


# http://www.tuicool.com/articles/jMF773

# Create universal (device + simulator) lib
./create_universal_lib.sh

cd ..
xcodebuild -showBuildSettings | \
sed -e '1d;s/^[ ]*/export /;s/ = \([^"].*\)/="\1"/;s/ = /=/;s/export UID.*//' > /tmp/xcodebuild-var.tmp
source /tmp/xcodebuild-var.tmp
rm /tmp/xcodebuild-var.tmp

MODULE_NAME="WiSeCloudAPISDK"
BUILD_ARTIFACTS_DIR="../../build/${MODULE_NAME}" &&
UNIVERSAL_LIB_DIR="${BUILD_ARTIFACTS_DIR}/${CONFIGURATION}-iphoneuniversal" &&
UNIVERSAL_LIB_HEADER_DIR="${UNIVERSAL_LIB_DIR}/include/${PRODUCT_NAME}" &&
UNIVERSAL_LIB="${UNIVERSAL_LIB_DIR}/lib${PROJECT_NAME}.a" &&

FRAMEWORK_NAME="${PRODUCT_NAME}" &&
FRAMEWORK_DIR="${BUILD_ARTIFACTS_DIR}/Frameworks" &&
FRAMEWORK="${FRAMEWORK_DIR}/${FRAMEWORK_NAME}.framework" &&

# Create framework directory structure.
rm -rf "${FRAMEWORK}" &&
mkdir -p "${FRAMEWORK_DIR}" &&
mkdir -p "${FRAMEWORK}/Versions/A/Headers" &&
mkdir -p "${FRAMEWORK}/Versions/A/Resources" &&

# Move files to appropriate locations in framework paths.
cp "${UNIVERSAL_LIB}" "${FRAMEWORK}/Versions/A/${FRAMEWORK_NAME}" &&
cp ${UNIVERSAL_LIB_HEADER_DIR}/* ${FRAMEWORK}/Versions/A/Headers &&

ln -s "A" "${FRAMEWORK}/Versions/Current" &&
ln -s "Versions/Current/Headers" "${FRAMEWORK}/Headers" &&
ln -s "Versions/Current/Resources" "${FRAMEWORK}/Resources" &&
ln -s "Versions/Current/${FRAMEWORK_NAME}" "${FRAMEWORK}/${FRAMEWORK_NAME}"

open "${FRAMEWORK_DIR}"

cd Scripts

