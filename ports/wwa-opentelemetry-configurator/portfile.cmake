vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/opentelemetry-configurator-cpp
    REF 7656d4277ed69ec87f4365c246287261474cf3eb
    SHA512 bbdebad457fab1e8e7a58df99e6cc75723430c2899af6f85e512f882aeff560c135256ff6ab63c8085cbfc43630803c583447e881ec928d80e660b2b8663d3dd
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
