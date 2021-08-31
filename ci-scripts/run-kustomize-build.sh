#!/bin/bash

APP_OF_APPS=app-of-apps

function run_kustomize() {
  echo -n "Running kustomize in ${1} ... "
  out=$(cd "${1}" && kustomize build 2>&1)
  if [ $? -ne 0 ]; then
    echo FAILED
    echo "${out}"
    exit 1
  else
    echo OK
  fi
}

run_kustomize "${APP_OF_APPS}"

for env in envs/nerc/*; do
  run_kustomize "${env}"
done
