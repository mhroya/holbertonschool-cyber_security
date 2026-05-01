#!/bin/bash
sudo nmap -Pn -sF -p 80-85 -f -T2 "$1"
