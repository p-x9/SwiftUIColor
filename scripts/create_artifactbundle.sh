#!/usr/bin/env bash

set -Ceu

VERSION_STRING=$1

PRODUCT_NAME="prepare-swiftui-color"

ARTIFACT_BUNDLE_NAME="${PRODUCT_NAME}.artifactbundle"
ARTIFACT_BUNDLE_BIN_PATH="${ARTIFACT_BUNDLE_NAME}/${PRODUCT_NAME}/bin"

INFO_TEMPLATE="./scripts/info.json.template"

show_checksum() {
    CHECKSUM=$(swift package compute-checksum ./${ARTIFACT_BUNDLE_NAME}.zip)
    echo "checksum:"
    echo ${CHECKSUM}
}

create_artifact_bundle() {
    mkdir -p "${ARTIFACT_BUNDLE_BIN_PATH}"

    sed "s/__VERSION__/${VERSION_STRING}/g" ${INFO_TEMPLATE} > "${ARTIFACT_BUNDLE_NAME}/info.json"

    cp -f ".build/apple/Products/Release/${PRODUCT_NAME}" "${ARTIFACT_BUNDLE_BIN_PATH}"
    cp -f LICENSE "${ARTIFACT_BUNDLE_NAME}"
}

zip_artifact_bundle() {
    zip -yr - "${ARTIFACT_BUNDLE_NAME}" > "./${ARTIFACT_BUNDLE_NAME}.zip"
}

build_target() {
    swift build -c release --product $PRODUCT_NAME --arch arm64 --arch x86_64
}

clear_outputs() {
    rm -rf $ARTIFACT_BUNDLE_NAME
    rm -f "${ARTIFACT_BUNDLE_NAME}.zip"
}

clear_outputs

build_target
create_artifact_bundle
zip_artifact_bundle

show_checksum

