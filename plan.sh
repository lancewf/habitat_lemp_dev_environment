# This file is the heart of your application's habitat.
# See full docs at https://www.habitat.sh/docs/reference/plan-syntax/

pkg_name=lemp
pkg_origin=lancewf
pkg_version="0.0.1"
pkg_maintainer="Lance Finfrock <lfinfrock@chef.io>"
pkg_license=('Apache-2.0')
pkg_source=""
pkg_shasum="c11ce7580f21dfbca70dd6f817d3376385be6d34cf4d86f233eae3acb5fd87fd"

source_dir=$HAB_CACHE_SRC_PATH/${pkg_name}

pkg_svc_user=root
pkg_svc_group=$pkg_svc_user
pkg_svc_run="php-fpm --nodaemonize"

pkg_deps=(core/php core/nginx)

pkg_exports=(
   [port]=http.listen.port
)
pkg_exposes=(port)

pkg_binds=(
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
  mkdir $pkg_prefix/public_html
  cp source/* $pkg_prefix/public_html/
  return 0
}
