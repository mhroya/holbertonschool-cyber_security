#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: $0 <subnetwork>"
  exit 1
fi
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root or with sudo"
  exit 1
fi
nmap -PR -sn "$1"
