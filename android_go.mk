#
# Copyright (C) 2022 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Sets Android Go recommended default values for propreties.

# Start of Android Go properties

# Memory Optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lmk.critical_upgrade=true \
    ro.lmk.upgrade_pressure=0 \
    ro.lmk.downgrade_pressure=70 \
    ro.lmk.kill_heaviest_task=true \
    ro.statsd.enable=true \
    ro.vendor.qti.sys.fw.bg_apps_limit=8

# set threshold to filter unused apps
PRODUCT_PROPERTY_OVERRIDES += \
    pm.dexopt.downgrade_after_inactive_days=7

# set the compiler filter for shared apks to quicken.
# Rationale: speed has a lot of dex code expansion, it uses more ram and space
# compared to quicken. Using quicken for shared APKs on Go devices may save RAM.
# Note that this is a trade-off: here we trade clean pages for dirty pages,
# extra cpu and battery. That's because the quicken files will be jit-ed in all
# the processes that load of shared apk and the code cache is not shared.
# Some notable apps that will be affected by this are gms and chrome.
# b/65591595.

PRODUCT_PROPERTY_OVERRIDES += \
    pm.dexopt.shared=quicken

# 512MB specific properties.

# lmkd can kill more now.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lmk.medium=700

# madvise random in ART to reduce page cache thrashing.
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.madvise-random=true


# Start Android Go configuration

# Boot Profile
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_DISABLE_SCUDO := true

# Disable Scudo outside of eng builds to save RAM.
ifneq (,$(filter eng, $(TARGET_BUILD_VARIANT)))
  PRODUCT_DISABLE_SCUDO := true
endif

# Do not spin up a separate process for the network stack, use an in-process APK.
PRODUCT_PACKAGES += InProcessNetworkStack
PRODUCT_PACKAGES += CellBroadcastAppPlatform
PRODUCT_PACKAGES += CellBroadcastServiceModulePlatform
PRODUCT_PACKAGES += com.android.tethering.inprocess
