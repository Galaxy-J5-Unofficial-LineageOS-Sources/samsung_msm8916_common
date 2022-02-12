# Release name
PRODUCT_RELEASE_NAME := Samsung Galaxy J5

# Inherit from vendor
$(call inherit-product, vendor/samsung/j5-common/j5-common-vendor.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Include full languages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The target has no boot jars to check
SKIP_BOOT_JARS_CHECK := true

# APEX
TARGET_FLATTEN_APEX := true

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=21 \
    ro.vndk.version=current \
    ro.telephony.iwlan_operation_mode=legacy

# Include Bluetooth config
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

## Device identifier. This must come after all inclusions
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone
PRODUCT_GMS_CLIENTID_BASE := android-samsung
