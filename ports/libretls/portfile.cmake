set(VCPKG_POLICY_SKIP_COPYRIGHT_CHECK enabled)

vcpkg_download_distfile(ARCHIVE
    URLS "https://causal.agency/libretls/libretls-3.8.1.tar.gz"
    FILENAME "libretls-3.8.1.tar.gz"
    SHA512 bbf4854622401bfc8662016a73202467714b603425dea2012e72846f0a22412018448fda8befa777d67c5dae44839b81e3b039130cf4970a4026c178d3a43ce2
)

vcpkg_extract_source_archive(
    SOURCE_PATH
    ARCHIVE "${ARCHIVE}"
)

vcpkg_configure_make(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_install_make()
vcpkg_fixup_pkgconfig()

file(
    REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug/share"
        "${CURRENT_PACKAGES_DIR}/share"
)

include(CMakePackageConfigHelpers)
configure_package_config_file(
    "${CMAKE_CURRENT_LIST_DIR}/unofficial-${PORT}-config.cmake.in"
    "${CURRENT_PACKAGES_DIR}/share/unofficial-${PORT}/unofficial-${PORT}-config.cmake"
    INSTALL_DESTINATION "share/unofficial-${PORT}"
)

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
