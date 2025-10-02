#!/bin/bash
set -e

IMG_NAME="rtr_station.img"
XZ_NAME="rtr_station.img.xz"

# 1. Скачиваем Raspberry Pi OS Lite 64-bit
wget -O rpi_os.img.xz https://downloads.raspberrypi.org/raspios_lite_arm64_latest
unxz rpi_os.img.xz

# 2. Переименовываем
BASE_IMG=$(ls *.img | head -n 1)
mv "$BASE_IMG" "$IMG_NAME"

# 3. Сжимаем
xz -9 -T0 "$IMG_NAME"
mv "$IMG_NAME.xz" "$XZ_NAME"

echo "✅ Сборка завершена: $XZ_NAME"
