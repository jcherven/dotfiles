#!/bin/bash

if [["$OSTYPE" == "darwin"* ]]; then
  # For the Berkeley CS61a course's autograder
  alias ok="python3 ok --local"
  # For doing quiet ssh
  # sssh -p <port> <host@hostname> bash -i
  alias sssh="ssh -4 -C -T -o UserKnownHostsFile=/dev/null"
  # SSH tunneling for Plex
  alias plextunnel="ssh seedhostProxy -L 30539:localhost:30539"
fi

if [["$OSTYPE" == "linux-gnu" ]]; then
  alias sssh="echo 'install sssh ya dummy'"
fi

