#
# Copyright 2012 The Android Open Source Project
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

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Inherit from our custom product configuration
include vendor/omni/config/common_tablet.mk

# Omni specific board config
include device/htc/flounder/BoardConfigOmni.mk

# Inherit device configuration
$(call inherit-product, device/htc/flounder/aosp_flounder64.mk)

# Inherit device vendor (blobs)
$(call inherit-product-if-exists, vendor/htc/flounder/device-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/wifi_only_overlay

## Device identifier. This must come after all inclusions
PRODUCT_NAME := omni_flounder
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 9

# Fix for vendor / system prop mismatch
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=flounder \
    BUILD_FINGERPRINT=google/volantis/flounder:7.1.1/N9F27H/4108833:user/release-keys \
    PRIVATE_BUILD_DESC="volantis-user 7.1.1 N9F27H/4108833 release-keys"
    BUILD_ID=N9F27H

# SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

PRODUCT_COPY_FILES += \
    device/htc/flounder/audio_effects.conf:system/etc/audio_effects.conf

# Disable DEXPREOPT as it seems to break Wifi
WITH_DEXPREOPT := false
