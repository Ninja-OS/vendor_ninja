# Packages
PRODUCT_PACKAGES += \
    GBoardDarkTheme \
    SettingsDarkTheme \
    SystemDarkTheme \
    Turbo

# Overlays
PRODUCT_PACKAGES += \
    GBoardDark \
    SettingsDark \
    SystemDark

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs

# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    librsjni
