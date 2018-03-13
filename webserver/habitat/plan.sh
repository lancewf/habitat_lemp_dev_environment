# This file is the heart of your application's habitat.
# See full docs at https://www.habitat.sh/docs/reference/plan-syntax/
pkg_repo=lemp
pkg_name=lemp-webserver
pkg_origin=lancewf
pkg_version="0.2.0"
pkg_maintainer="Lance Finfrock <lfinfrock@chef.io>"
pkg_license=('Apache-2.0')
pkg_source=""

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user

pkg_deps=(core/nginx)

pkg_binds=(
  [site]="location"
)

do_download(){
    return 0
}

do_verify() {
  return 0
}

do_unpack() {
  return 0
}

do_build(){
  return 0
}

do_install() {
  return 0
}
