#!/bin/bash
function git_clone() {
  git clone --depth 1 $1 $2 || true
 }
function git_sparse_clone() {
  branch="$1" rurl="$2" localdir="$3" && shift 3
  #git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
  git clone -b $branch --single-branch --no-tags --depth 1 --filter=blob:none --no-checkout $rurl $localdir
  cd $localdir
  #git sparse-checkout init --cone
  #git sparse-checkout set $@
  git checkout $branch -- $@
  mv -n $@ ../
  cd ..
  rm -rf $localdir
  }

  function git_svn() {
  #branch="$1" rurl="$2" localdir="$3" && shift 3
  branch="$1" rurl="$2" && shift 2
  #git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
  git clone -b $branch --single-branch --no-tags --depth 1 --filter=blob:none --no-checkout $rurl tempxx
  cd tempxx
  #git sparse-checkout init --cone
  #git sparse-checkout set $@
  git checkout $branch -- $@
  mv -n $@ ../
  cd ..
  rm -rf tempxx
  }
function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}

###########自定义部分##################
git_sparse_clone master "https://github.com/Hyy2001X/AutoBuild-Packages" "Hyy2001X" luci-app-npc
rm -rf luci-app-filebrowser filebrowser
git_sparse_clone main "https://github.com/Lienol/openwrt-package" "Lienol" luci-app-filebrowser
git clone --depth 1 https://github.com/Leo-Jo-My/luci-theme-opentomcat
git clone --depth 1 https://github.com/Leo-Jo-My/luci-theme-opentomato
rm -rf luci-app-wechatpush
git clone -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush luci-app-serverchan

git clone -b main https://github.com/padavanonly/luci-app-mwan3helper-chinaroute luci-app-mwan3helper-chinaroute


#kenzok8/wall(将kenzok8自建常用的内核更改为breakings/OpenWrt/blob/main/diy-part2.sh中的源，只添加breakings中有的源)
git_sparse_clone main "https://github.com/xiaorouji/openwrt-passwall-packages" "xiaorouji" chinadns-ng dns2socks hysteria ipt2socks \
microsocks pdnsd-alt shadowsocks-rust simple-obfs sing-box ssocks tcping trojan-go trojan-plus trojan v2ray-core v2ray-plugin

git_sparse_clone master "https://github.com/fw876/helloworld" "fw876" dns2tcp lua-neturl redsocks2 shadowsocksr-libev v2ray-geodata

rm -rf brook dockerd gost naiveproxy smartdns xray-core xray-plugin
git_sparse_clone main "https://github.com/breakings/OpenWrt" "breakings" general/brook general/dockerd general/gost general/naiveproxy \
general/smartdns general/xray-core general/xray-plugin

#git_sparse_clone packages-18.06 "https://github.com/Boos4721/OpenWrt-Packages" "Boos4721" adbyby
#git clone --depth 1 https://github.com/aboutboy/luci-theme-butongwifi
#git_sparse_clone master "https://github.com/Aslin-Ameng/luci-theme-Night" "Aslin-Ameng" luci-theme-Night
#git clone --depth 1 https://github.com/gngpp/luci-theme-design
#git clone --depth 1 https://github.com/gngpp/luci-app-design-config
#git_sparse_clone master "https://github.com/kiddin9/openwrt-packages" "kiddin9" luci-app-bypass
#git clone --depth 1 https://github.com/jerrykuku/lua-maxminddb
#git clone --depth 1 https://github.com/immortalwrt/homeproxy
#git_sparse_clone master "https://github.com/coolsnowwolf/luci" "coolsnowwolf" applications/luci-app-accesscontrol
git clone --depth 1 https://github.com/gngpp/luci-app-watchcat-plus
rm -rf msd_lite
git_sparse_clone master "https://github.com/immortalwrt/packages" "immortalwrt" net/msd_lite
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go ddnsgo && mv -n ddnsgo/ddns-go ./; rm -rf ddnsgo


#####luci-theme-design#####
git_svn main https://github.com/fichenx/packages luci-theme-design
git_svn main https://github.com/fichenx/packages luci-app-design-config

#####luci-app-watchcat-plus#####
git_svn main https://github.com/fichenx/packages luci-app-watchcat-plus

#####bypass依赖#####
git_svn main https://github.com/fichenx/packages luci-app-bypass
git_svn master https://github.com/fw876/helloworld shadowsocksr-libev redsocks2 lua-neturl dns2tcp

#####luci-app-v2raya依赖#####
git_svn master https://github.com/v2rayA/v2raya-openwrt v2raya

#####luci-app-lucky及依赖#####
rm -rf luci-app-lucky lucky
git_svn main https://github.com/gdy666/luci-app-lucky lucky

#####luci-app-vssr#####
git clone -b master https://github.com/MilesPoupart/luci-app-vssr luci-app-vssr

#####luci-app-socat#####
rm -rf luci-app-socat
git_svn main https://github.com/chenmozhijin/luci-app-socat luci-app-socat

#####luci-app-mosdns mosdns v2dat#####
rm -rf luci-app-mosdns mosdns v2dat
git_svn v5-lua https://github.com/sbwml/luci-app-mosdns luci-app-mosdns mosdns v2dat 

#####luci-app-ikoolproxy#####
rm -rf luci-app-ikoolproxy
git_svn ipk https://github.com/ilxp/luci-app-ikoolproxy luci-app-ikoolproxy


############暂时替换原kenzok8/small-package/.github/diy/main.sh中无法使用的svn命令############
git_sparse_clone master "https://github.com/immortalwrt/luci" "temp" applications/luci-app-homeproxy
git_sparse_clone master "https://github.com/coolsnowwolf/luci" "temp" libs/luci-lib-ipkg
git_sparse_clone master "https://github.com/x-wrt/packages" "temp" net/nft-qos
git_sparse_clone master "https://github.com/x-wrt/luci" "temp" applications/luci-app-nft-qos
git_sparse_clone other "https://github.com/Lienol/openwrt-package" "temp" lean/luci-app-autoreboot
git_sparse_clone develop "https://github.com/Ysurac/openmptcprouter-feeds" "temp" luci-app-iperf
git_sparse_clone master "https://github.com/QiuSimons/OpenWrt-Add" "temp" luci-app-irqbalance
git_sparse_clone main "https://github.com/sirpdboy/sirpdboy-package" "temp" luci-app-control-speedlimit
#git_sparse_clone master "https://github.com/xiaoxifu64/immortalwrt" "temp" package/rooter/ext-rooter-basic
git_sparse_clone openwrt-22.03 "https://github.com/openwrt/luci" "temp" applications/luci-app-wireguard
git_sparse_clone main "https://github.com/lucikap/Brukamen" "temp" luci-app-ua2f
git_sparse_clone master "https://github.com/openwrt/packages" "temp" net/shadowsocks-libev
git_sparse_clone main "https://github.com/kenzok8/jell" "temp" vsftpd-alt
git_sparse_clone main "https://github.com/kenzok8/jell" "temp" luci-app-bridge
############暂时替换原kenzok8/small-package/.github/diy/main.sh中无法使用的svn命令############


# 修改nps源为yisier
sed -i 's/PKG_SOURCE_URL:=.*/PKG_SOURCE_URL:=https:\/\/codeload.github.com\/yisier\/nps\/tar.gz\/v$(PKG_VERSION)?/g' nps/Makefile
sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=0.26.16.1/g' nps/Makefile
sed -i 's/PKG_HASH:=.*/PKG_HASH:=2fb8a19d2bd34d6a009f14d1c797169f09801eb814f57ebf10156ffdb78f2457/g' nps/Makefile

#luci-app-nps（修改nps显示位置）
sed -i 's/"services"/"vpn"/g'  nps/luasrc/controller/nps.lua
sed -i 's/\[services\]/\[vpn\]/g'  nps/luasrc/view/nps/nps_status.htm

sed -i 's/"services"/"vpn"/g'  luci-app-npc/luasrc/controller/npc.lua
sed -i 's/\[services\]/\[vpn\]/g' luci-app-npc/luasrc/view/npc/npc_status.htm

#修改luci-app-autotimeset显示位置
sed -i 's/"control"/"system"/g'  luci-app-autotimeset/luasrc/controller/autotimeset.lua
sed -i 's/\[control\]/\[system\]/g'  luci-app-autotimeset/luasrc/view/autotimeset/log.htm

#删除UPX
rm -rf upx
rm -rf upx-static

######################################

exit 0
