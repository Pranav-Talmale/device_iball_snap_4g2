#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from Snap_4G2 device
$(call inherit-product, device/iball/Snap_4G2/device.mk)

PRODUCT_DEVICE := Snap_4G2
PRODUCT_NAME := omni_Snap_4G2
PRODUCT_BRAND := iBall
PRODUCT_MODEL := Snap_4G2
PRODUCT_MANUFACTURER := iball

PRODUCT_GMS_CLIENTID_BASE := android-sanmu

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="full_iball8735m_9706b-user 7.0 NRD90M 1528730155 release-keys"

BUILD_FINGERPRINT := iBall/Snap_4G2/Snap_4G2:7.0/NRD90M/1528730155:user/release-keys
