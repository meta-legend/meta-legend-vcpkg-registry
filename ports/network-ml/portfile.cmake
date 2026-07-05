vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO meta-legend/network-ml-library
    REF "v${VERSION}"
    SHA512 f0458dfb3fc556caf5fb3b94dbbd559cefbed50d7fda16d4ad5674123d1665e25cf0862aa48388f5fd5cfe17b1322019e2f8e22457bad20e1488520e9feed511
    HEAD_REF main
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME NetworkML CONFIG_PATH lib/cmake/NetworkML)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
