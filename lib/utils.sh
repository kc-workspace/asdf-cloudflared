#!/usr/bin/env bash

## User utility functions
## This will load on very beginning of the scripts
## so make sure that you only define functions

download_ext() {
  if [[ "$KC_ASDF_OS" == "darwin" ]]; then
    printf ".tgz"
  else
    printf ""
  fi
}

_kc_asdf_custom_arch() {
  local arch="$1"
  kc_asdf_is_darwin &&
    arch="amd64"
  printf "%s" "$arch"
}

_kc_asdf_custom_env() {
  ## https://github.com/cloudflare/cloudflared/issues/1004
  kc_asdf_is_darwin &&
    export ASDF_INSECURE=true
}
