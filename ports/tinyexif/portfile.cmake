vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Beholder-Vision/TinyEXIF
    REF def752505527d50b0150bc3405de3a00ce3e8446
    SHA512 88bdaa4b00bc3661dfdd2da626f6d244410449707fe4bfc5e4b8bc7d941225b0442abb359395377356e1915d63cd4adb332ffbfd43904053eb4fe38d7ac7f2d8
    HEAD_REF beholder
)

string(COMPARE EQUAL "${VCPKG_LIBRARY_LINKAGE}" "static" BUILD_STATIC_LIBS)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    # BUILD_SHARED_LIBS is auto set by vcpkg
    OPTIONS
        -DBUILD_STATIC_LIBS=${BUILD_STATIC_LIBS}
        -DBUILD_DEMO=OFF
        -DENABLE_XMP_SUPPORT=OFF
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/TinyEXIF)

vcpkg_copy_pdbs()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

# Handle copyright
file(INSTALL "${SOURCE_PATH}/README.md" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
