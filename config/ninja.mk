# Copyright (C) 2016-2017 NinjaOS
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

# NINJA RELEASE VERSION
NINJA_VERSION_MAJOR = 8
NINJA_VERSION_MINOR = 1
NINJA_VERSION_MAINTENANCE = 0

VERSION := $(NINJA_VERSION_MAJOR).$(NINJA_VERSION_MINOR).$(NINJA_VERSION_MAINTENANCE)


ifndef NINJA_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "NINJA_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^NINJA_||g')
        NINJA_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

ifeq ($(NINJA_BUILDTYPE), OFFICIAL)
    NINJA_VERSION := NinjaOS-$(VERSION)_$(NINJA_BUILDTYPE)-$(shell date -u +%Y%m%d)

else ifeq ($(NINJA_BUILDTYPE), EXPERIMENTAL)
    NINJA_VERSION := NinjaOS-$(VERSION)_$(NINJA_BUILDTYPE)-$(shell date -u +%Y%m%d)

else
    # If NINJA_BUILDTYPE is not defined, set to UNOFFICIAL
    NINJA_BUILDTYPE := UNOFFICIAL
    NINJA_VERSION := NinjaOS-$(NINJA_TAG)-$(VERSION)_$(NINJA_BUILDTYPE)-$(shell date -u +%Y%m%d)-$(NINJA_BUILD)
endif


PRODUCT_PROPERTY_OVERRIDES += \
    ro.ninja.releasetype=$(NINJA_BUILDTYPE) \
    ro.modversion=$(NINJA_VERSION) \
    ro.ninja.version=$(VERSION)-$(NINJA_BUILDTYPE)
