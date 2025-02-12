vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO sjinks/coro-cpp
    REF 2b50ab4e5f18498f60e2629ae2386d9662d1559c
    SHA512 7241fab0bf2a3c98260cbfba1f290ab61d73e323ebfc8660f419e5c30acf111cbb8bd3c38b77dd075a135403713d8d796af35e5d2b784201c3c6ef97986842f9
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS -DBUILD_TESTS=OFF -DBUILD_DOCS=OFF -DBUILD_EXAMPLES=OFF
)

vcpkg_cmake_install()
vcpkg_fixup_pkgconfig()
vcpkg_cmake_config_fixup(PACKAGE_NAME wwa-coro CONFIG_PATH "lib/cmake/wwa-coro")

file(
    REMOVE_RECURSE
        "${CURRENT_PACKAGES_DIR}/debug/include"
        "${CURRENT_PACKAGES_DIR}/debug/share"
)

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
file(COPY "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
