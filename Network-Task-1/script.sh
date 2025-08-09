#!/bin/bash

# Network Task - 1

# ----------------------------------------------------------------------------------------

# Get ip address of the domain using nslookup :
nslookup guvi.in

# Get IP address of the domain with dns/A records using dig:
dig guvi.in

#  ----------------------------------------------------------------------------------------

# Get CPU/Memory/Read/Write resource usages :

# Graphically or Visually interactive monitor inside the shell:
htop

# Using top (no colors or graohics. This is the base version of htop):
top

# -----------------------------------------------------------------------------------------

# Connection check between two nodes :

ping 172.31.42.203  # from our system to check another node, whether it is connected or not.

# -----------------------------------------------------------------------------------------
