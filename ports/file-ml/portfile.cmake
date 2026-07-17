vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO meta-legend/file-ml-library
    REF "v${VERSION}"
    SHA512 f75d898ae52fc275ee5b466a43aaae2f99876d24bc07795582164dfb2797635f919f7d902b6ecbb07fc7ec547323cc1ce08da1780e08c2838100138a6686fdb6
    HEAD_REF main
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME FileML CONFIG_PATH lib/cmake/FileML)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
