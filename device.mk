#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/iball/Snap_4G2

# ---------------------------------------------------------
# 1. File Copying
# ---------------------------------------------------------
# Format: <SOURCE_FILE_LOCATION>:<DESTINATION_IN_RAMDISK>

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/system/etc/recovery.fstab:recovery/root/etc/recovery.fstab 

# ---------------------------------------------------------
# 2. Filesystem & Utility Packages
# ---------------------------------------------------------
# Omni's common.mk includes many tools, but not always the specific 
# filesystem tools defined in your BoardConfig (F2FS, NTFS).
PRODUCT_PACKAGES += \
    libf2fs_fmt_host \
    fs_cksum \
    e2fsdroid \
    make_ext4fs \
    mke2fs \
    resize2fs \
    f2fs-tools

# ---------------------------------------------------------
# 3. Device Characteristics
# ---------------------------------------------------------
# Tells Android this is a tablet (matches your ProjectConfig screen specs)
PRODUCT_CHARACTERISTICS := tablet