# == Class: openssl::install::linux
#
# This compiles and installs OpenSSL on Linux
#
class openssl::install::linux {
  $autotools_environment = $openssl::autotools_environment
  $prefix                = $openssl::prefix
  $source_dir_path       = $openssl::source_dir_path

  autotools { "openssl":
    configure_file     => "config",
    configure_flags    => "--prefix=${prefix} shared",
    configure_sentinel => "${source_dir_path}/Makefile.bak",
    cwd                => $source_dir_path,
    environment        => $autotools_environment,
    install_sentinel   => "${prefix}/lib/libssl.so",
    require            => Exec["untar-openssl"],
  }
}
