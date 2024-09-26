vcpkg_download_distfile(ARCHIVE
    URLS "https://download.savannah.nongnu.org/releases/libassh/libassh-1.1.tar.gz"
    FILENAME "libassh-1.1.tar.gz"
    SHA512 f0ffc060b7bb634128f560727db04a1d84d85dea87e489b14eb9ffb3c3d46ee08dd1ffa4b8ae50f2725c70a51de2fbefbfcc2da5998908bc5f9f75681d5cf222
)

vcpkg_extract_source_archive(
    SOURCE_PATH
    ARCHIVE "${ARCHIVE}"
    PATCHES "skip-tests.patch"
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        client WITH_CLIENT
        server WITH_SERVER
        userauth-none WITH_USERAUTH_NONE
        userauth-password WITH_USERAUTH_PASSWORD
        userauth-publickey WITH_USERAUTH_PUBLICKEY
        userauth-hostbased WITH_USERAUTH_HOSTBASED
        userauth-keyboard WITH_USERAUTH_KEYBOARD
        key-create WITH_KEY_CREATE
        key-validate WITH_KEY_VALIDATE
        zlib WITH_ZLIB
        openssl WITH_OPENSSL
        gcrypt WITH_GCRYPT
        sodium WITH_SODIUM
)

if(NOT WITH_CLIENT AND NOT WITH_SERVER)
    message(FATAL_ERROR "At least one of 'client' or 'server' features must be enabled")
endif()

set(options "--disable-examples" "--disable-dependency-tracking" "--with-kex=all" "--with-sign=all" "--with-alloc=all" "--with-prng=all" "--with-ciphers=all" "--with-macs=all")

if(WITH_GCRYPT OR WITH_OPENSSL OR WITH_SODIUM)
    set(options "${options};--with-hashes=external")
else()
    set(options "${options};--with-hashes=builtin")
endif()

function(maybe_enable_option condition option)
    if (${condition})
        set(options "${options};--enable-${option}" PARENT_SCOPE)
    else()
        set(options "${options};--disable-${option}" PARENT_SCOPE)
    endif()
endfunction()

function(maybe_with_option condition option)
    if (${condition})
        set(options "${options};--with-${option}" PARENT_SCOPE)
    else()
        set(options "${options};--without-${option}" PARENT_SCOPE)
    endif()
endfunction()

maybe_enable_option(WITH_CLIENT client)
maybe_enable_option(WITH_SERVER server)
maybe_enable_option(WITH_USERAUTH_NONE none-userauth)
maybe_enable_option(WITH_USERAUTH_PASSWORD password-userauth)
maybe_enable_option(WITH_USERAUTH_PUBLICKEY publickey-userauth)
maybe_enable_option(WITH_USERAUTH_HOSTBASED hostbased-userauth)
maybe_enable_option(WITH_USERAUTH_KEYBOARD keyboard-userauth)
maybe_enable_option(WITH_KEY_CREATE key-create)
maybe_enable_option(WITH_KEY_VALIDATE key-validate)

maybe_with_option(WITH_ZLIB zlib)
maybe_with_option(WITH_OPENSSL openssl)
maybe_with_option(WITH_GCRYPT gcrypt)
maybe_with_option(WITH_SODIUM sodium)

vcpkg_configure_make(
    SOURCE_PATH "${SOURCE_PATH}"
    AUTOCONFIG
    OPTIONS
        ${options}
    OPTIONS_RELEASE
        "--disable-assert"
)

vcpkg_install_make()
vcpkg_fixup_pkgconfig()

include(CMakePackageConfigHelpers)
configure_package_config_file(
    "${CMAKE_CURRENT_LIST_DIR}/unofficial-${PORT}-config.cmake.in"
    "${CURRENT_PACKAGES_DIR}/share/unofficial-${PORT}/unofficial-${PORT}-config.cmake"
    INSTALL_DESTINATION "share/unofficial-${PORT}"
)

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")
