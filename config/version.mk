# Copyright (C) 2016-2017 AOSiP
# Copyright (C) 2020 Fluid
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

# Versioning System
IRON_CODENAME := MacteAnimo
IRON_NUM_VER := 2.3

TARGET_PRODUCT_SHORT := $(subst iron_,,$(IRON_BUILD_TYPE))

IRON_BUILD_TYPE ?= UNOFFICIAL

# Only include Updater for official, weeklies, CI and nightly builds
ifeq ($(filter-out OFFICIAL WEEKLIES NIGHTLY CI,$(IRON_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        Updater
endif

# Sign builds if building an official, weekly, CI and nightly build
ifeq ($(filter-out OFFICIAL WEEKLIES NIGHTLY CI,$(IRON_BUILD_TYPE)),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := $(KEYS_LOCATION)
endif

# Set all versions
BUILD_DATE := $(shell date -u +%Y%m%d)
BUILD_TIME := $(shell date -u +%H%M)
IRON_BUILD_VERSION := $(IRON_NUM_VER)-$(IRON_CODENAME)
IRON_VERSION := $(IRON_BUILD_VERSION)-$(IRON_BUILD_TYPE)-$(IRON_BUILD)-$(BUILD_DATE)-$(BUILD_TIME)
ifeq ($(WITH_GAPPS), true)
IRON_VERSION := $(IRON_VERSION)-gapps
endif
ROM_FINGERPRINT := Iron/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(BUILD_TIME)
IRON_DISPLAY_VERSION := $(IRON_VERSION)
RELEASE_TYPE := $(IRON_BUILD_TYPE)
