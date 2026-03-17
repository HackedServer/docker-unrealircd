#!/bin/sh
if [ "$1" = "start" ]; then
  ./unrealircd start
  tail -F logs/ircd.log &
  TAIL_PID=$!
  while kill -0 $(cat data/unrealircd.pid) 2>/dev/null; do
    sleep 5
  done
  kill $TAIL_PID
  exit 1
else
  exec ./unrealircd "$@"
fi
