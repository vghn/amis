#!/usr/bin/env bash
# Common functions

# Output
e_ok()    { printf "  ✔  %s\\n" "$@" ;}
e_info()  { printf "  ➜  %s\\n" "$@" ;}
e_error() { printf "  ✖  %s\\n" "$@" ;}
e_warn()  { printf "    %s\\n" "$@" ;}
e_abort() { e_error "$1"; return "${2:-1}" ;}

# Clean-up
clean_up() {
  if [[ "${CI:-false}" == 'true' ]]; then
    if [[ -s "${APPDIR}/.env" ]]; then
      e_info 'Removing .env'
      rm -rf "${APPDIR:?}/.env"
    fi
  fi
}

# Trap exit
bye(){
  clean_up; exit "${1:-0}"
}
