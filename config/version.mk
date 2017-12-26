# Copyright (C) 2017 Ninja-OS
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

#Ninja Versioning
# Versioning System
# ninja first version.
PRODUCT_VERSION_MAJOR = 8.1
PRODUCT_VERSION_MINOR = ALPHA
PRODUCT_VERSION_MAINTENANCE =
NINJA_POSTFIX := -$(shell date +"%Y%m%d")
ifdef NINJA_BUILD_EXTRA
    NINJA_POSTFIX := -$(NINJA_BUILD_EXTRA)
endif

ifndef NINJA_BUILD_TYPE
    NINJA_BUILD_TYPE := UNOFFICIAL
endif

# Set all versions
NINJA_VERSION := NinjaOS-$(NINJA_BUILD)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(PRODUCT_VERSION_MAINTENANCE)$(NINJA_BUILD_TYPE)$(NINJA_POSTFIX)
NINJA_MOD_VERSION := NinjaOS-$(NINJA_BUILD)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(PRODUCT_VERSION_MAINTENANCE)$(NINJA_BUILD_TYPE)$(NINJA_POSTFIX)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ninja.ota.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE) \
    ro.ninja.version=$(NINJA_VERSION) \
    ro.modversion=$(NINJA_MOD_VERSION) \
ro.ninja.buildtype=$(NINJA_BUILD_TYPE)