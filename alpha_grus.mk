#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/alpha/config/common_full_phone.mk)

# Inherit from grus device
$(call inherit-product, device/xiaomi/grus/device.mk)

PRODUCT_NAME := alpha_grus
PRODUCT_DEVICE := grus
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Mi 9 SE

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="grus-user 11 RKQ1.200826.002 V12.5.1.0.RFBMIXM release-keys" \
    BuildFingerprint=Xiaomi/grus/grus:11/RKQ1.200826.002/V12.5.1.0.RFBMIXM:user/release-keys

# Device config
TARGET_HAS_UDFPS := true
TARGET_ENABLE_BLUR := true
TARGET_EXCLUDES_AUDIOFX := true
TARGET_FACE_UNLOCK_SUPPORTED := true

# Build config

# TARGET_BUILD_PACKAGE options:
# 1 - vanilla (default)
# 2 - microg
# 3 - gapps
TARGET_BUILD_PACKAGE := 3

# Launcher
TARGET_INCLUDE_LAWNCHAIR := false
ifeq ($(TARGET_BUILD_PACKAGE),3)
# (valid only for GAPPS builds)
TARGET_INCLUDE_PIXEL_LAUNCHER := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_SUPPORTS_CALL_RECORDING := true
TARGET_INCLUDE_STOCK_ARCORE := false
TARGET_INCLUDE_LIVE_WALLPAPERS := false
TARGET_SUPPORTS_GOOGLE_RECORDER := false
endif

# Debugging
TARGET_INCLUDE_MATLOG := false
WITH_ADB_INSECURE := true
TARGET_BUILD_PERMISSIVE := false
SELINUX_IGNORE_NEVERALLOWS := false

# Extras
TARGET_INCLUDE_RIMUSIC := true

# Maintainer
ALPHA_BUILD_TYPE := Official
ALPHA_MAINTAINER := elpaablo
