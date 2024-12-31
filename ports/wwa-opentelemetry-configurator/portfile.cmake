vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/opentelemetry-configurator-cpp
    REF bf70cfa7bdd2289a1d2155c4b3bb3f4f87f75b01
    SHA512 b4f0104dc48780e9cdae5accda8818a4d208592808a38ac37bbc970311cc61d5410312f655f6dc1bd3d406014e7b68f25968800f9fa77436bd75477be365c40a
)

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(PACKAGE_NAME wwa_opentelemetry_configurator CONFIG_PATH "lib/cmake/wwa_opentelemetry_configurator")

file(
    REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug/include"
        "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
