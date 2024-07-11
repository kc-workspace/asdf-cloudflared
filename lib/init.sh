#!/usr/bin/env bash

## User init functions
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

_kc_asdf_custom_enabled_features() {
  local ns="feature-custom.utils"
  local feature="$1"

  ## https://github.com/cloudflare/cloudflared/issues/1004
  if [[ "$feature" == "checksum" ]] && kc_asdf_is_darwin; then
    kc_asdf_debug "$ns" "disable %s feature on macOS because %s" \
      "$feature" "https://github.com/cloudflare/cloudflared/issues/1004"
    return 1
  fi
  return 0
}
