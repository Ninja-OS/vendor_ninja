# Copyright (C) 2017 NINJA
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

# include definitions for SDCLANG
# include vendor/ninja/sdclang/sdclang.mk

include vendor/ninja/config/version.mk

PRODUCT_BRAND ?= NINJA

# Use signing keys for user builds
ifeq ($(TARGET_BUILD_VARIANT),user)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/ninja/.keys/release
endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/ninja/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/ninja/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/ninja/prebuilt/common/bin/50-base.sh:system/addon.d/50-base.sh \

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/ninja/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip


DEVICE_PACKAGE_OVERLAYS += \
    vendor/ninja/overlay/common \
    vendor/ninja/overlay/dictionaries

# Custom NINJA packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    LatinIME \
    Launcher3 \
    LiveWallpapers \
    LiveWallpapersPicker \
    OTAUpdates \
    Stk \
    Turbo \
    ViaBrowser \
    Phonograph \
    WallpaperPickerGoogle

# Default permissions
PRODUCT_COPY_FILES += \
    vendor/ninja/prebuilt/common/etc/privapp-permissions-ninja.xml:system/etc/permissions/privapp-permissions-ninja.xml

# Themes
PRODUCT_PACKAGES += \
    PixelTheme \
    Stock

# Extra tools
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs \
    7z \
    bzip2 \
    curl \
    lib7z \
    powertop \
    pigz \
    tinymix \
    unrar \
    unzip \
    zip

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/ninja/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# For keyboard gesture typing
ifneq ($(filter ninja_jflte ninja_onyx,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    vendor/ninja/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinime.so
else
PRODUCT_COPY_FILES += \
    vendor/ninja/prebuilt/common/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinime.so
endif

# init.d support
PRODUCT_COPY_FILES += \
    vendor/ninja/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner

# LatinIME gesture typing
ifeq ($(TARGET_ARCH),arm64)
PRODUCT_COPY_FILES += \
    vendor/phenom/prebuilt/common/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so \
    vendor/phenom/prebuilt/common/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so
else
PRODUCT_COPY_FILES += \
    vendor/phenom/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so \
    vendor/phenom/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
endif

# PHENOM-specific init file
PRODUCT_COPY_FILES += \
    vendor/ninja/prebuilt/common/etc/init.local.rc:root/init.ninja.rc

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/phenom/prebuilt/common/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    vendor/phenom/prebuilt/common/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/ninja/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Fix Dialer
PRODUCT_COPY_FILES +=  \
    vendor/aosp/prebuilt/common/etc/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl
    
# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

# Changelog
PRODUCT_COPY_FILES += \
    vendor/ninja/Changelog.md:system/etc/Changelog.md

# Needed by some RILs and for some gApps packages
PRODUCT_PACKAGES += \
    librsjni \
    libprotobuf-cpp-full

# Charger images
PRODUCT_PACKAGES += \
    charger_res_images

# Recommend using the non debug dexpreopter
USE_DEX2OAT_DEBUG ?= false

# Magisk
ifeq ($(WITH_ROOT),true)
 PRODUCT_COPY_FILES += \
    vendor/ninja/prebuilt/common/magisk/Magisk.zip:install/magisk/Magisk.zip
else
$(warning Root method is undefined, please use 'WITH_ROOT := true' to define it)
endif
