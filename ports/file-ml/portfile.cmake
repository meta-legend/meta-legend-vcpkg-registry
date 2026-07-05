vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO meta-legend/file-ml-library
    REF "v${VERSION}"
    SHA512 b100703d131d3dfc072cff3f01d5bef83e8454153325356d02e1c185339f5c9d982a2131c188c7c93e3c4a42307209069c470fcb2bf7cd068f6949219f77faee
    HEAD_REF main
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME FileML CONFIG_PATH lib/cmake/FileML)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
