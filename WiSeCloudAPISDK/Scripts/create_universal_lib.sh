
# http://www.tuicool.com/articles/jMF773

cd ..
xcodebuild -showBuildSettings | \
sed -e '1d;s/^[ ]*/export /;s/ = \([^"].*\)/="\1"/;s/ = /=/;s/export UID.*//' > /tmp/xcodebuild-var.tmp
source /tmp/xcodebuild-var.tmp
rm /tmp/xcodebuild-var.tmp

MODULE_NAME="WiSeCloudAPISDK"
BUILD_ARTIFACTS_DIR="../../build/${MODULE_NAME}" &&
UNIVERSAL_LIB_DIR="${BUILD_ARTIFACTS_DIR}/${CONFIGURATION}-iphoneuniversal" &&
UNIVERSAL_LIB_HEADER_DIR="${UNIVERSAL_LIB_DIR}/include/${PRODUCT_NAME}" &&

SIMULATOR_LIB="${BUILD_ARTIFACTS_DIR}/${CONFIGURATION}-iphonesimulator/lib${PROJECT_NAME}.a" &&
DEVICE_LIB="${BUILD_ARTIFACTS_DIR}/${CONFIGURATION}-iphoneos/lib${PROJECT_NAME}.a" &&
UNIVERSAL_LIB="${UNIVERSAL_LIB_DIR}/lib${PROJECT_NAME}.a" &&


xcodebuild clean
xcodebuild  -sdk iphonesimulator -configuration ${CONFIGURATION} -target ${PROJECT_NAME} OBJROOT=${BUILD_ARTIFACTS_DIR} SYMROOT=${BUILD_ARTIFACTS_DIR} ARCHS="i386 x86_64"

xcodebuild clean
xcodebuild  -sdk iphoneos -configuration ${CONFIGURATION} -target ${PROJECT_NAME} OBJROOT=${BUILD_ARTIFACTS_DIR} SYMROOT=${BUILD_ARTIFACTS_DIR} ARCHS="armv7 arm64"




mkdir -p "${UNIVERSAL_LIB_DIR}" &&
mkdir -p "${UNIVERSAL_LIB_HEADER_DIR}" &&

# Generate universal binary for the device and simulator.
lipo "${SIMULATOR_LIB}" "${DEVICE_LIB}" -create -output "${UNIVERSAL_LIB}"

#Copy header files from any of DEVICE or SIMULATOR locations
cp ${BUILD_ARTIFACTS_DIR}/${CONFIGURATION}-iphonesimulator/include/${PRODUCT_NAME}/* ${UNIVERSAL_LIB_HEADER_DIR}

cd Scripts