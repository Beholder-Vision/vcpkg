vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO Beholder-Vision/TinyEXIF
    REF 9cd9560e9291877270e777636b086dedff637ddf
    SHA512 21683024a2040ca8e76e08b62dfd67001b730328de555ea205c7b5ce73d7fd61388f3a5ac80cea8f78a35bffada9219b23b17c37af75b86e069327e04777ea65
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
