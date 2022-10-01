vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Beholder-Vision/TinyEXIF
    REF b772bdfe81ef6979b409d3a67e9d40afaa0f3d57
    SHA512 c63e245de5e143adb1603b25ea6a1e9ce314dd1632773df4accc5037c4611d993c885bc3ace799906452f349fa19c0acb5f337f90dba5d9504657699dcc16274
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
