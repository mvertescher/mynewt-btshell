#!/usr/bin/env bash
#
# Build the btshell application

set -eux

NEWT=$(pwd)/newt

# Create the project
rm -rf proj
$NEWT new proj && cd proj

# Upgrade and work around a bug...
$NEWT upgrade || true
rm -f repos/mcuboot/ext/mbedtls/include/mbedtls/check_config.h
rm -f repos/mcuboot/ext/mbedtls/include/mbedtls/config.h
$NEWT upgrade

# Create and build the bootloader
$NEWT target create nrf52840_boot
$NEWT target set nrf52840_boot app=@mcuboot/boot/mynewt
$NEWT target set nrf52840_boot bsp=@apache-mynewt-core/hw/bsp/nrf52840pdk
$NEWT target set nrf52840_boot build_profile=optimized
$NEWT build nrf52840_boot

# Create and build `btshell`
$NEWT target create nrf52840_btshell
$NEWT target set nrf52840_btshell app=@apache-mynewt-nimble/apps/btshell \
  bsp=@apache-mynewt-core/hw/bsp/nrf52840pdk \
  build_profile=optimized
$NEWT build nrf52840_btshell
$NEWT create-image nrf52840_btshell 0
