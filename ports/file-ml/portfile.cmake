vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO meta-legend/file-ml-library
    REF "v${VERSION}"
    SHA512 ca0e2a27ab5afa9fa7811d9f149a391dcf06503f28399caea792d91895a02ae1765c36320452b9c72748b041d3e7e1c881fe44e36152049b138e58924908ef08
    HEAD_REF main
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME FileML CONFIG_PATH lib/cmake/FileML)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
