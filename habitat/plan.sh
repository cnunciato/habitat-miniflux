pkg_name=miniflux
pkg_origin=cnunciato
pkg_version="2.0.10"
pkg_maintainer="Christian Nunciato <chris@nunciato.org>"
pkg_upstream_url="https://docs.miniflux.app/en/latest/"
pkg_license=("Apache-2.0")
pkg_bin_dirs=(bin)

pkg_deps=(
  core/wget
  core/go
  core/postgresql
)

pkg_binds=(
  [db]="superuser_name superuser_password port"
)

do_download() {
  pushd "${HAB_CACHE_SRC_PATH}"
    wget "https://github.com/miniflux/miniflux/releases/download/${pkg_version}/miniflux-linux-amd64"
  popd
}

do_build() {
  return 0
}

do_install() {
  pushd "${HAB_CACHE_SRC_PATH}"
    mv miniflux-linux-amd64 miniflux
    chmod +x miniflux
    cp miniflux "${pkg_prefix}/bin/"
  popd
}
