pkg_repo=lemp
pkg_name=lemp-site
pkg_origin=lancewf
pkg_version="0.2.0"
pkg_maintainer="Lance Finfrock <lfinfrock@chef.io>"
pkg_license=('Apache-2.0')
pkg_description=""

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_deps=(core/php core/mysql-client)

pkg_exports=(
  [location]=location
)
pkg_exposes=()

pkg_binds=(
  [database]="port username password"
  [webserver]=""
)

do_build(){
  return 0
}

do_install() {
  mkdir $pkg_prefix/static
  cp -r src/* $pkg_prefix/static/.
  mkdir $pkg_prefix/database
  cp -r habitat/database/* $pkg_prefix/database/.
}
