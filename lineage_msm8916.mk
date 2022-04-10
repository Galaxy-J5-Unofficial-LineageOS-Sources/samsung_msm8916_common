#
# Copyright (C) 2017-2021 The LineageOS Project
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

# Inherit from common
$(call inherit-product, device/samsung/qcom-common/qcom-common.mk)

# Include proprietary blobs
$(call inherit-product-if-exists, vendor/samsung/msm8916-common/msm8916-common-vendor.mk)

# Include Pixel Launcher
$(call inherit-product, vendor/PixelMod/PixelMod.mk)

# Define paths
LOCAL_PATH := device/samsung/msm8916-common
COMMON_PATH := device/samsung/msm8916-common
DEVICE_PATH := device/samsung/msm8916-common

# Include system.prop 
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Include product.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop

# Chipset - Properties
ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8929)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.chipname=MSM8929
else ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8939)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.chipname=MSM8939
endif

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# APEX
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/apex/ld.config.txt:$(TARGET_COPY_OUT_SYSTEM)/etc/swcodec/ld.config.txt
    
# A2DP
PRODUCT_PACKAGES += \
  audio.a2dp.default \
  android.hardware.bluetooth.a2dp@1.0-impl \
  android.hardware.bluetooth.a2dp@1.0-service

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@7.0-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.service \
    android.hardware.soundtrigger@2.0-impl \
    android.hardware.soundtrigger@2.1-impl \
    android.hardware.soundtrigger@2.2-impl \
    android.hardware.soundtrigger@2.3-impl \
    sound_trigger.stub.default \
    audio.a2dp.default \
    audio.bluetooth.default \
    audio.primary.msm8916 \
    audio.primary.default \
    audio.r_submix.default \
    audio.usb.default \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    tinyplay \
    tinycap \
    tinypcminfo \
    libtinycompress

# Audio configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

ifneq ($(USE_CUSTOM_MIXER_PATHS), true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml
endif

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth.audio@2.1-impl \
    android.hardware.bluetooth.audio@2.0-impl \
    android.hardware.bluetooth@1.0.vendor \
    android.hardware.bluetooth@1.1.vendor \
    libbase_shim

PRODUCT_PACKAGES += \
    libldacBT_bco \
    libldacBT_dec

DEVICE_MANIFEST_FILE += device/samsung/msm8916-common/Manifest/bluetooth-manifest.xml

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.5-impl \
    android.hardware.camera.provider@2.5-service-lazy \
    vendor.qti.hardware.camera.device@1.0.vendor \
    camera.device@1.0-impl \
    camera.device@3.2-impl \
    camera.msm8916 \
    libcamera_shim \
    libmm-qcamera

DEVICE_MANIFEST_FILE += device/samsung/msm8916-common/Manifest/camera-manifest.xml

# Connectivity Engine support
PRODUCT_PACKAGES += \
    libcnefeatureconfig
    
# Data configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/data/dsi_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/data/dsi_config.xml \
    $(LOCAL_PATH)/configs/data/netmgr_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/data/netmgr_config.xml \
    $(LOCAL_PATH)/configs/data/qmi_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/data/qmi_config.xml

# Dex
PRODUCT_DEXPREOPT_SPEED_APPS += \
    TrebuchetQuickStep \
    Settings \
    SystemUI
    
# Display
PRODUCT_PACKAGES += \
    disable_configstore \
    android.hidl.allocator@1.0 \
    android.hidl.allocator@1.0.vendor \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.allocator@3.0-service \
    android.hardware.graphics.allocator@3.0-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service \
    gralloc.msm8916 \
    hwcomposer.msm8916 \
    copybit.msm8916 \
    memtrack.msm8916 \
    libtinyxml \
    libtinyxml2 \
    vendor.lineage.livedisplay@2.0-service.samsung-qcom

    
# Display Device Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/displayconfig/display_id_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/displayconfig/display_id_0.xml

# Dolby
PRODUCT_PROPERTY_OVERRIDES += \
    ro.feature.dolby_enable=true \
    vendor.audio.dolby.ds2.enabled=true \
    vendor.audio.dolby.ds2.hardbypass=false

# Surface Flinger properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.force_hwc_copy_for_virtual_displays=true \
    ro.surface_flinger.max_virtual_display_dimension=2048 \
    ro.surface_flinger.start_graphics_allocator_service=true \
    ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
    debug.renderengine.backend=threaded \
    debug.sf.enable_gl_backpressure=1 \
    debug.composition.type=c2d \
    debug.egl.hw=1 \
    debug.sf.hw=1 \
    debug.hwui.use_buffer_age=false 
    
# API
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=21 \
    ro.vndk.version=current

# Debloater
PRODUCT_PACKAGES += \
    RemoveCamera2 \
    RemoveGallery2 \
    RemoveEleven \
    RemoveJely \
    RemoveEtar \
    RemoveAudioFX

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    android.hardware.drm@1.0-service-lazy \
    android.hardware.drm@1.4-service-lazy.clearkey
    
# Encryption
PRODUCT_PACKAGES += \
    vendor.qti.hardware.cryptfshw@1.0-service-qti.qsee

# Protobuf
PRODUCT_PACKAGES += \
    libprotobuf-cpp-lite-v28 \
    libprotobuf-cpp-full-v28

# FastCharge
PRODUCT_PACKAGES += \
    vendor.lineage.fastcharge@1.0-service.usb

# FM
PRODUCT_PACKAGES += \
    qcom.fmradio \
    FM2

# For config.fs
PRODUCT_PACKAGES += \
    fs_config_files

# FS
PRODUCT_PACKAGES += \
    fsck.f2fs

# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-service.software \
    android.hardware.gatekeeper@1.0.vendor 

# Google Photos
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/pixel/pixel_2016_exclusive.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_2016_exclusive.xml


# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    android.hardware.gnss@1.0-service \
    com.android.location.provider \
    com.android.location.provider.xml \
    gps.msm8916 \
    libshim_gps \
    liblocadapterbase_shim \
    liblocapibase_shim
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/flp.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/flp.conf \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/izat.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/izat.conf \
    $(LOCAL_PATH)/configs/gps/sap.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/sap.conf   
    
# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# HIDL 
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 
    
PRODUCT_PACKAGES += \
    libhidltransport \
    libhwbinder \
    libjson \
    libjson.vendor 

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/sec_touchkey.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sec_touchkey.kl \
    $(LOCAL_PATH)/keylayout/sec_touchscreen.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/sec_touchscreen.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl

# Keymaster
PRODUCT_PACKAGES += \
   android.hardware.keymaster@3.0-impl \
   android.hardware.keymaster@3.0-service \
    android.hardware.gatekeeper@1.0.vendor 

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-service.msm8916
    
# Low Memory Killer
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.config.ulmk_memcg=true \
    ro.lmk.use_psi=false \
    ro.lmk.critical=0 \
    ro.lmk.low=950 \
    ro.lmk.swap_free_low_percentage=15    
    
# Media configurations
ifneq ($(TARGET_BOARD_PLATFORM_VARIANT),msm8929)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml
else
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs_8929.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml
endif

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video_le.xml

# Media
PRODUCT_PACKAGES += \
   libextmedia_jni \
    libdashplayer \
    libdivxdrmdecrypt \
    libdrmclearkeyplugin \
    libstagefrighthw \
    libstagefright_soft_flacdec 
    
# Media - OpenMAX
PRODUCT_PACKAGES += \
    android.hardware.media.omx@1.0-service \
    libmm-omxcore \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc
    
# Misc
PRODUCT_PACKAGES += \
    curl \
    libcurl \
    libkeyutils \
    tcpdump
      
# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0    
    
# Netmgrd
PRODUCT_PACKAGES += \
    android.system.net.netd@1.1.vendor
    
# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/handheld_core_hardware.xml

# Power configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/power/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

# Power HAL
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti \
    android.hardware.power.stats@1.0-service.mock 
    
PRODUCT_COPY_FILES += \
    system/core/libprocessgroup/profiles/cgroups_28.json:$(TARGET_COPY_OUT_VENDOR)/etc/cgroups.json \
    system/core/libprocessgroup/profiles/task_profiles_28.json:$(TARGET_COPY_OUT_VENDOR)/etc/task_profiles.json
    
# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio@1.1 \
    android.hardware.radio@1.1.vendor \
    libshim_secril \
    libshim_ril \
    libxml2 \
    macloader \
    libcutils_shim

DEVICE_MANIFEST_FILE += device/samsung/msm8916-common/Manifest/radio-manifest.xml

# Repainter integration
PRODUCT_PACKAGES += \
    RepainterServicePriv

# Rootdir
PRODUCT_PACKAGES += \
    init.carrier.rc \
    init.qcom.early_boot.sh \
    init.target.rc \
    init.class_main.sh \
    init.link_ril_db.sh \
    init.qcom.bt.sh \
    init.qcom.fm.sh \
    init.qcom.post_boot.sh \
    init.qcom.sh \
    init.qcom.uicc.sh \
    init.qcom.usb.sh \

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    init.qcom.usb.rc \
    init.recovery.qcom.rc \
    ueventd.qcom.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom \
    $(LOCAL_PATH)/configs/tweaks.rc:system/vendor/etc/init/tweaks.rc

# RRO
PRODUCT_ENFORCE_RRO_TARGETS := \
    framework-res

# Seccomp
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/mediacodec-seccomp.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

# RIL
PRODUCT_PACKAGES += \
	libril \
	librilutils \
	rild \
	librmnetctl 

PRODUCT_PROPERTY_OVERRIDES += \
# Ril sends only one RIL_UNSOL_CALL_RING, so set call_ring.multiple to false
ro.telephony.call_ring.multiple=0

# Security configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/ril/sec_config:$(TARGET_COPY_OUT_VENDOR)/etc/sec_config

# Sensor HAL
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    android.hardware.sensors@1.0-service \
    libsensorndkbridge \
    sensors.msm8916
    
# Thermal HAL
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0-service.msm8916

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal_info_config.json:$(TARGET_COPY_OUT_VENDOR)/etc/thermal_info_config.json \
    $(LOCAL_PATH)/configs/thermal/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf

PRODUCT_PROPERTY_OVERRIDES += \
    vendor.thermal.config=thermal_info_config.json
    
 #Secure element
PRODUCT_PACKAGES += \
    android.hardware.secure_element@1.2.vendor 

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.1 \
    android.hardware.nfc@1.1-service \
    vendor.nxp.nxpnfc@1.0 \
    vendor.nxp.hardware.nfc@1.0-service

PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    com.gsma.services.nfc \
    com.nxp.nfc.nq \
    nfc_nci.nqx.default \
    nqnfcee_access.xml \
    NfcNci \
    Tag

PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/nfc/libnfc-nci.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/libnfc-nci.conf \
    $(COMMON_PATH)/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \
    $(COMMON_PATH)/configs/nfc/libnfc-nxp_RF.conf:$(TARGET_COPY_OUT_VENDOR)/etc/nfc/libnfc-nxp.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/com.nxp.mifare.xml  
  
# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Su Binary
PRODUCT_PACKAGES += \
    phh-su \
    SuperUser

# Tethering
PRODUCT_PACKAGES += \
    TetheringConfigOverlay

# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic \
    android.hardware.usb.gadget@1.0-impl \
    android.hardware.usb.gadget@1.0-service

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service
    
# Vendor service manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Wifi configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/cred.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/cred.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/WCNSS_cfg.dat:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_wlan_nv.bin:$(TARGET_COPY_OUT_SYSTEM)/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# WiDi
PRODUCT_PACKAGES += \
    com.android.media.remotedisplay \
    com.android.media.remotedisplay.xml

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service.legacy \
    android.hardware.wifi@1.5.vendor \
    hostapd \
    hostapd_cli \
    libwpa_client \
    libwcnss_qmi \
    wcnss_service\
    wificond \
    wpa_supplicant
    
# Boot Profile
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_DISABLE_SCUDO := true

# Do not spin up a separate process for the network stack, use an in-process APK.
PRODUCT_PACKAGES += InProcessNetworkStack
PRODUCT_PACKAGES += CellBroadcastAppPlatform
PRODUCT_PACKAGES += CellBroadcastServiceModulePlatform
PRODUCT_PACKAGES += com.android.tethering.inprocess
