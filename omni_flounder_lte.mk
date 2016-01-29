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

# Include from WiFi
include device/htc/flounder/omni_flounder.mk

# Inherrit GSM APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherrit LTE config
$(call inherit-product, device/htc/flounder/device-lte.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/lte_only_overlay

## Device identifier. This must come after all inclusions
PRODUCT_NAME := omni_flounder_lte
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 9
