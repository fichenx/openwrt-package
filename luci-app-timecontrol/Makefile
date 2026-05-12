# Copyright (C) 2025 GaoBin <gaobin89@foxmail.com>
#
# This is free software, licensed under the GNU General Public License v3.
#

include $(TOPDIR)/rules.mk

LUCI_TITLE:=LuCI support for Time Control (JavaScript)
LUCI_PKGARCH:=all
PKG_NAME:=luci-app-timecontrol
PKG_VERSION:=2.4.2
PKG_RELEASE:=20251204

include $(TOPDIR)/feeds/luci/luci.mk

define Package/$(PKG_NAME)/prerm
	#!/bin/sh
	if [ -f /etc/config/timecontrol ]; then
		echo "backing up existing configuration..."
		cp -f /etc/config/timecontrol /tmp/timecontrol_backup
	fi
	exit 0
endef

define Package/$(PKG_NAME)/postinst
	#!/bin/sh
	if [ -f /tmp/timecontrol_backup ]; then
		echo "restoring configuration from backup..."
		mv -f /tmp/timecontrol_backup /etc/config/timecontrol
	fi
	/etc/init.d/timecontrol enable >/dev/null 2>&1 || true
	rm -f /tmp/luci-indexcache* 2>/dev/null
	exit 0
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
