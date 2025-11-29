#!/bin/bash
function git_clone() {
  git clone --depth 1 $1 $2 || true
 }


function git_sparse_clone() {
  branch="$1" rurl="$2" && shift 2
  rootdir="$PWD"
  git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl temp_sparse
  #git clone -b $branch --single-branch --no-tags --depth 1 --filter=blob:none --no-checkout $rurl temp_sparse
  cd temp_sparse
  git sparse-checkout init --cone
  git sparse-checkout set $@
  pkg=`echo $@ | tr ' ' '\n' | rev | cut -d'/' -f 1 | rev | tr '\n' ' ' `
  #[ -d ../package/custom ] && cd ../package/custom && rm -rf $pkg && cd "$rootdir"/temp_sparse
  cd ../ && rm -rf $pkg && cd "$rootdir"/temp_sparse
  mv -f $@ ../
  cd ..
  rm -rf temp_sparse
  }
 
function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}


echo "开始 同步自定义插件（mysh）……"
echo "========================="

###########自定义部分##################
git_sparse_clone master https://github.com/Hyy2001X/AutoBuild-Packages luci-app-npc
rm -rf luci-app-filebrowser filebrowser
git_sparse_clone main https://github.com/Lienol/openwrt-package luci-app-filebrowser
git clone --depth 1 https://github.com/Leo-Jo-My/luci-theme-opentomcat
git clone --depth 1 https://github.com/Leo-Jo-My/luci-theme-opentomato
rm -rf luci-app-wechatpush
git clone -b openwrt-18.06 https://github.com/tty228/luci-app-wechatpush luci-app-serverchan

git clone -b main https://github.com/padavanonly/luci-app-mwan3helper-chinaroute luci-app-mwan3helper-chinaroute


#kenzok8/wall(将kenzok8自建常用的内核更改为breakings/OpenWrt/blob/main/diy-part2.sh中的源，只添加breakings中有的源)
#git_sparse_clone main https://github.com/xiaorouji/openwrt-passwall-packages pdnsd-alt sing-box ssocks trojan-go trojan-plus geoview

#git_sparse_clone master https://github.com/fw876/helloworld naiveproxy dns2tcp lua-neturl redsocks2 shadowsocks-libev shadowsocksr-libev v2ray-geodata chinadns-ng dns2socks hysteria ipt2socks microsocks shadowsocks-rust simple-obfs tcping trojan v2ray-core v2ray-plugin

#rm -rf brook dockerd gost smartdns xray-core xray-plugin
#git_sparse_clone main https://github.com/breakingbadboy/OpenWrt general/brook general/docker general/dockerd general/gost general/smartdns general/xray-core general/xray-plugin

#git_sparse_clone packages-18.06 https://github.com/Boos4721/OpenWrt-Packages adbyby
#git clone --depth 1 https://github.com/aboutboy/luci-theme-butongwifi
#git_sparse_clone master https://github.com/Aslin-Ameng/luci-theme-Night luci-theme-Night
#git clone --depth 1 https://github.com/gngpp/luci-theme-design
#git clone --depth 1 https://github.com/gngpp/luci-app-design-config
#git_sparse_clone master https://github.com/kiddin9/openwrt-packages luci-app-bypass
#git clone --depth 1 https://github.com/jerrykuku/lua-maxminddb
#git clone --depth 1 https://github.com/immortalwrt/homeproxy
#git_sparse_clone master https://github.com/coolsnowwolf/luci applications/luci-app-accesscontrol
git clone --depth 1 https://github.com/gngpp/luci-app-watchcat-plus

rm -rf msd_lite
git_sparse_clone master https://github.com/immortalwrt/packages net/msd_lite
#更换msd_lite源为修改版（可以反向代理）
#sed -i 's|PKG_SOURCE_URL:=.*|PKG_SOURCE_URL:=https://github.com/fichenx/msd_lite.git|g'  msd_lite/Makefile
#sed -i 's|PKG_SOURCE_DATE:=.*|PKG_SOURCE_DATE:=2024-12-16|g'  msd_lite/Makefile
#sed -i 's|PKG_SOURCE_VERSION:=.*|PKG_SOURCE_VERSION:=983f5c07527b0c87a6494db49eade57da3c516bf|g'  msd_lite/Makefile
#sed -i 's|PKG_MIRROR_HASH:=.*|PKG_MIRROR_HASH:=11039120524d97a23ebf57f4ac494464cff6dd07a843c0b968ef818920361965|g'  msd_lite/Makefile

git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go ddnsgo && mv -n ddnsgo/ddns-go ./; rm -rf ddnsgo


#####luci-theme-design#####
git_sparse_clone main https://github.com/fichenx/packages luci-theme-design
git_sparse_clone main https://github.com/fichenx/packages luci-app-design-config

#####luci-app-watchcat-plus#####
git_sparse_clone main https://github.com/fichenx/packages luci-app-watchcat-plus

#####bypass依赖#####
git_sparse_clone main https://github.com/fichenx/packages luci-app-bypass
git_sparse_clone master https://github.com/fw876/helloworld shadowsocksr-libev redsocks2 lua-neturl dns2tcp

#####luci-app-v2raya依赖#####
git_sparse_clone master https://github.com/v2rayA/v2raya-openwrt v2raya

#####luci-app-lucky及依赖#####
rm -rf luci-app-lucky lucky
git_sparse_clone main https://github.com/gdy666/luci-app-lucky luci-app-lucky lucky

#####luci-app-vssr#####
git clone -b master https://github.com/MilesPoupart/luci-app-vssr luci-app-vssr

#####luci-app-socat#####
rm -rf luci-app-socat
git_sparse_clone main https://github.com/chenmozhijin/luci-app-socat luci-app-socat

#####luci-app-mosdns mosdns v2dat#####
rm -rf luci-app-mosdns mosdns v2dat
git_sparse_clone v5-lua https://github.com/sbwml/luci-app-mosdns luci-app-mosdns mosdns v2dat 

#####luci-app-ikoolproxy#####
rm -rf luci-app-ikoolproxy luci-app-godproxy
git clone -b main https://github.com/ilxp/luci-app-ikoolproxy luci-app-ikoolproxy

#####openwrt-dogcom#####
git clone --depth=1 https://github.com/mchome/openwrt-dogcom.git

#####urllogger#####
git_sparse_clone master https://github.com/x-wrt/com.x-wrt urllogger

#####tuic-client、shadow-tls#####
git_sparse_clone master https://github.com/fw876/helloworld tuic-client shadow-tls

#####n3n#####
git_sparse_clone main https://github.com/fichenx/packages n3n

#####rtp2httpd#####
git_sparse_clone main https://github.com/stackia/rtp2httpd openwrt-support/luci-app-rtp2httpd openwrt-support/rtp2httpd

#####luci-app-vnt#####
git_sparse_clone main https://github.com/lmq8267/luci-app-vnt luci-app-vnt

#####使用lede的docker和dockerd#####
#rm -rf docker dockerd
#git_sparse_clone master https://github.com/coolsnowwolf/packages utils/docker utils/dockerd

#####xray-geodata-cut#####
git clone --depth 1 https://github.com/yichya/openwrt-xray-geodata-cut

#####luci-app-taskplan 任务设置2.0版#####
git_sparse_clone master https://github.com/sirpdboy/luci-app-taskplan luci-app-taskplan

#####luci-app-netspeedtest 网速测试lua版#####
git_sparse_clone lua https://github.com/sirpdboy/luci-app-netspeedtest luci-app-netspeedtest homebox

#####luci-app-parentcontrol 专为手机用户制作：家长控制 ，可以按时间控制机器，端口和关键字过滤等。#####
git clone --depth 1 https://github.com/sirpdboy/luci-app-parentcontrol

#####删除kenzok8/small-package中的js版luci-app，替换为18.06版
rm -rf luci-theme-argon luci-app-argon-config luci-theme-kucat
git clone --depth 1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon
git clone --depth 1 -b 18.06 https://github.com/jerrykuku/luci-app-argon-config
git clone --depth 1 https://github.com/sirpdboy/luci-theme-kucat -b 18.06 --depth 1

#####删除kenzok8/small-package中的js版luci-app，无替换版本
rm -rf luci-app-homeproxy

#####shadowsocks-libev (ss-local ss-redir ss-tunnel ss-server)#####
git_sparse_clone master https://github.com/fw876/helloworld shadowsocks-libev


############暂时替换原kenzok8/small-package/.github/diy/main.sh中无法使用的svn命令############
git_sparse_clone master https://github.com/immortalwrt/luci applications/luci-app-homeproxy
git_sparse_clone master https://github.com/coolsnowwolf/luci libs/luci-lib-ipkg
git_sparse_clone master https://github.com/x-wrt/packages net/nft-qos
git_sparse_clone master https://github.com/x-wrt/luci applications/luci-app-nft-qos
git_sparse_clone other https://github.com/Lienol/openwrt-package lean/luci-app-autoreboot
git_sparse_clone develop https://github.com/Ysurac/openmptcprouter-feeds luci-app-iperf
git_sparse_clone master https://github.com/QiuSimons/OpenWrt-Add luci-app-irqbalance
#git_sparse_clone main https://github.com/sirpdboy/sirpdboy-package luci-app-control-speedlimit
#git_sparse_clone master https://github.com/xiaoxifu64/immortalwrt package/rooter/ext-rooter-basic
git_sparse_clone openwrt-22.03 https://github.com/openwrt/luci applications/luci-app-wireguard
git_sparse_clone main https://github.com/lucikap/Brukamen luci-app-ua2f
#git_sparse_clone master https://github.com/openwrt/packages net/shadowsocks-libev
git_sparse_clone main https://github.com/kenzok8/jell vsftpd-alt luci-app-bridge
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

#修复部分插件Makefile文件include使用相对目录问题
sed -i 's|../../lang/golang/golang-package.mk|$(TOPDIR)/feeds/packages/lang/golang/golang-package.mk|g' dockerd/Makefile
sed -i 's|../../luci.mk|$(TOPDIR)/feeds/luci/luci.mk|g' luci-app-nft-qos/Makefile
sed -i 's|../../luci.mk|$(TOPDIR)/feeds/luci/luci.mk|g' luci-app-wireguard/Makefile
sed -i 's|../../luci.mk|$(TOPDIR)/feeds/luci/luci.mk|g' luci-lib-ipkg/Makefile

#更新dockerd(修改前使用的源为：https://github.com/kenzok8/wall)
#sed -i 's|\(PKG_VERSION:=\)[0-9]\+\.[0-9]\+\.[0-9]\+|\128.3.0|g' dockerd/Makefile
#sed -i 's|PKG_HASH:=.*|PKG_HASH:=99fe19d2a15d3cc56b9bd5e782664a85c2a7027566a4acc5c07ec8d42666362b|g' dockerd/Makefile
sed -i 's|PKG_GIT_REF:=v|PKG_GIT_REF:=docker-v|g' dockerd/Makefile
#更新docker(修改前使用的源为：https://github.com/kenzok8/wall)
#sed -i 's|\(PKG_VERSION:=\)[0-9]\+\.[0-9]\+\.[0-9]\+|\128.3.0|g' docker/Makefile
#sed -i 's|PKG_HASH:=.*|PKG_HASH:=0ac18927138cd2582e02277d365174a118b962f10084a6bef500a58de705e094|g' docker/Makefile




######################################

exit 0
