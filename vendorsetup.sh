#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export PATH=$JAVA_HOME/bin:$PATH
export LC_ALL=C
export ALLOW_MISSING_DEPENDENCIES=true

add_lunch_combo omni_Snap_4G2-user
add_lunch_combo omni_Snap_4G2-userdebug
add_lunch_combo omni_Snap_4G2-eng

mkdir -p /tmp/omni_python2_fix
ln -sf $(which python2) /tmp/omni_python2_fix/python
export PATH=/tmp/omni_python2_fix:$PATH