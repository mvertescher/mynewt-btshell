#!/usr/bin/env bash
#
# Flash the btshell application

set -eux

NEWT=$(pwd)/newt

cd proj

# Load the bootloader and `btshell` onto the board
$NEWT load nrf52840_boot
$NEWT load nrf52840_btshell
