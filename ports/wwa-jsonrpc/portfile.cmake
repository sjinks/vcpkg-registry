vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/jsonrpc-cpp
    REF c38b81db758fe1cc965ea396efb84d474aad6e30 # v3.0.0
    SHA512 121ce21ed588b38715412e9d61795371e48cc09200ba98a7e884568425468e33a0b18faef6dacd32cba6eee0db9dfd15d359a8f5b382f1d9e0403facf8331746
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS -DBUILD_TESTS=OFF -DBUILD_DOCS=OFF
)

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(PACKAGE_NAME wwa_jsonrpc CONFIG_PATH "lib/cmake/wwa_jsonrpc")

file(
    REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug/include"
        "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
