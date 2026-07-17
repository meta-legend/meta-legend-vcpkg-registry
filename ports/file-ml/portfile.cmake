vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO meta-legend/file-ml-library
    REF "v${VERSION}"
    SHA512 6c8687d379d4f04d5e58bce5d4d1e711e07f9afbca7c4f9af22fb2cf6673d4446f4d9697dc5bbe863837d4d451c1277d97ec2669a21348359f35139fac258e02
    HEAD_REF main
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")
vcpkg_cmake_install()
vcpkg_cmake_config_fixup(PACKAGE_NAME FileML CONFIG_PATH lib/cmake/FileML)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
