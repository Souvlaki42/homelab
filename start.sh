#!/usr/bin/env bash

main() {
  if [ "$#" -ne 1 ]; then
    echo "App name wasn't passed"
    return 1
  fi

  sudo docker compose -f ./caddy/compose.yml up --no-recreate -d
  sudo docker compose -f "./$1/compose.yml" up --no-recreate -d --build
}

main "$@"
