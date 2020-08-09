#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  # make ssh a little quieter. usage:
  # sssh -p <port> <host@hostname> bash -i
  alias sssh="ssh -4 -C -T -o UserKnownHostsFile=/dev/null"
  # SSH tunneling for Plex
  alias plextunnel="ssh seedhostProxy -L 30539:localhost:30539"
fi

# if [["$OSTYPE" == "linux-gnu" ]]; then
#   #aliases that are only needed on linux go here
# fi
#
