#!/bin/bash
sudo nmap -sn  -PA 22,80,443 $1
