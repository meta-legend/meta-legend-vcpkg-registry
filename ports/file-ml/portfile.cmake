vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO meta-legend/file-ml-library
    REF "v${VERSION}"
    SHA512 c501985a65da1765b1e2f832bac6f895570dc79ad8e1f57467d71e7948574d13a6941494b76e12a57907fecfe544c8b49c5d4ab21edfedb0fc761cf666503d74
    HEAD_REF main
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME FileML CONFIG_PATH lib/cmake/FileML)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
