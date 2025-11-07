![kenzo github stats](https://github-readme-stats.vercel.app/api?username=fichenx&show_icons=true&theme=merko)
<div align="center">
<h1 align="center">同步上游分支代码</h1>
<img src="https://img.shields.io/github/issues/fichenx/openwrt-package?color=green">
<img src="https://img.shields.io/github/stars/fichenx/openwrt-package?color=yellow">
<img src="https://img.shields.io/github/forks/fichenx/openwrt-package?color=orange">
<img src="https://img.shields.io/github/license/fichenx/openwrt-package?color=ff69b4">
<img src="https://img.shields.io/github/languages/code-size/fichenx/openwrt-package?color=blueviolet">
</div>


#### openwrt-package

*  常用OpenWrt软件包源码合集，同步上游更新！

*  通用版luci适合18.06与19.07

*  关于有好的插件请在issues提交

*  感谢以上github仓库所有者！

##### 插件下载:

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/fichenx/compile-package?style=for-the-badge&label=插件更新下载)](https://github.com/fichenx/compile-package/releases/latest)

##### 关于Secrets、TOKEN的小知识


1. 首先需要获取 **Github Token**: [点击这里](https://github.com/settings/tokens/new) 获取,

 `Note`项填写一个名称,`Select scopes`不理解就**全部打勾**,操作完成后点击下方`Generate token`

2. 复制页面中生成的 **Token**,并保存到本地,**Token 只会显示一次!**

3. **Fork** 我的`openwrt-package`仓库,然后进入你的`openwrt-package`仓库进行之后的设置

4. 点击上方菜单中的`Settings`,依次点击`Secrets`-`New repository secret`

其中`Name`项填写`ACCESS_TOKEN`,然后将你的 **Token** 粘贴到`Value`项,完成后点击`Add secert`

* 对应`.github/workflows`目录下的`yml`工作流文件里的`ACCESS_TOKEN`名称（依据自己yml文件修改）

* 在仓库`Settings->Secrets`中添加 `SCKEY `可通过[Server酱](http://sc.ftqq.com) 推送编译结果到微信

* 在仓库`Settings->Secrets`中添加 `TELEGRAM_CHAT_ID, TELEGRAM_TOKEN `可推送编译结果到`Telegram Bot`




#### 使用方式（三选一）：

1. 先cd进package目录，然后执行

```bash
 git clone https://github.com/fichenx/openwrt-package
```
2. 或者添加下面代码到feeds.conf.default文件

```bash
 src-git small8 https://github.com/fichenx/openwrt-package
```
3. lede/下运行 或者openwrt/下运行

```bash
git clone https://github.com/fichenx/openwrt-package package/openwrt-package
```


<details>
<summary><b>&nbsp;OpenWrt 编译 LuCI ---> Applications 添加插件应用说明 【人人为我，我为人人】   2022.11.28 更新 ！！！</b><br/></summary>

make menuconfig  进入定制界面<br/>
进入编译选项配置界面,.按照需要配置.( ‘*’ 代表编入固件，‘M’ 表示编译成模块或者IPK包， ‘空’不编译 )<br/>
非常感谢大佬”L有大雕“更正补充，20181121<br/>
大佬源码仓库：https://github.com/coolsnowwolf/lede<br/>
内容仅供参考，请根据个人实际情况使用，如果出现问题则后果自负。<br/>
注：应用后面标记 “ * ” 为最近新添加；标记“ ! ”与其他插件依赖或冲突。<br/>
-------------------------------------------------------------------------------------------------------------------<br/>
LuCI ---> Applications ---> luci-app-accesscontrol             #访问时间控制<br/>
LuCI ---> Applications ---> luci-app-acme             #ACME自动化证书管理环境<br/>
LuCI ---> Applications ---> luci-app-adblock   #ADB广告过滤<br/>
LuCI ---> Applications ---> luci-app-adbyby-plus             #广告屏蔽大师Plus +<br/>
LuCI ---> Applications ---> luci-app-adbyby   #广告过滤大师（丢弃）<br/>
LuCI ---> Applications ---> luci-app-adguardhome             #AdGuard home广告过滤（Le库以外的插件）<br/>
LuCI ---> Applications ---> luci-app-adkill     #广告过滤（丢弃）<br/>
LuCI ---> Applications ---> luci-app-advanced-reboot             #Linksys高级重启<br/>
LuCI ---> Applications ---> luci-app-advancedsetting             #系统高级设置（Le库以外的插件）<br/>
LuCI ---> Applications ---> luci-app-ahcp             #Ad-Hoc配置协议(AHCP) ipv6 and 双栈 自动配置协议 !<br/>
LuCI ---> Applications ---> luci-app-airplay2   #Apple AirPlay2 无损音频接收服务器<br/>
LuCI ---> Applications ---> luci-app-aliddns   #阿里DDNS客户端（丢弃，集成至ddns）<br/>
LuCI ---> Applications ---> luci-app-aliyundrive-fuse             #阿里云盘FUSE磁盘挂载  *<br/>
LuCI ---> Applications ---> luci-app-aliyundrive-webdav             #阿里云盘 WebDAV 服务<br/>
LuCI ---> Applications ---> luci-app-amule             #aMule下载工具 !<br/>
LuCI ---> Applications ---> luci-app-argon-config             #Argon主题配置插件（Le库以外的插件）<br/>
LuCI ---> Applications ---> luci-app-aria2 # Aria2下载工具<br/>
LuCI ---> Applications ---> luci-app-arpbind             #IP/MAC绑定<br/>
LuCI ---> Applications ---> luci-app-asterisk             #支持Asterisk电话服务器<br/>
LuCI ---> Applications ---> luci-app-attendedsysupgrade             #固件更新升级相关<br/>
LuCI ---> Applications ---> luci-app-autoreboot             #支持计划重启<br/>
LuCI ---> Applications ---> luci-app-baidupcs-web             #百度网盘管理<br/>
LuCI ---> Applications ---> luci-app-bcp38             #BCP38网络入口过滤（不确定）<br/>
LuCI ---> Applications ---> luci-app-bird1-ipv4             #对Bird1-ipv4的支持<br/>
LuCI ---> Applications ---> luci-app-bird1-ipv6             #对Bird1-ipv6的支持<br/>
LuCI ---> Applications ---> luci-app-bird4   #Bird 4（未知）（丢弃）<br/>
LuCI ---> Applications ---> luci-app-bird6   #Bird 6（未知）（丢弃）<br/>
LuCI ---> Applications ---> luci-app-bmx6             #BMX6路由协议<br/>
LuCI ---> Applications ---> luci-app-bmx7             #BMX7路由协议（丢弃）<br/>
LuCI ---> Applications ---> luci-app-caldav             #联系人（丢弃）<br/>
LuCI ---> Applications ---> luci-app-cifs-mount   #CIFS/SMB挂载设置<br/>
LuCI ---> Applications ---> luci-app-cifsd             #CIFS/SMB网络共享<br/>
LuCI ---> Applications ---> luci-app-cjdns             #加密IPV6网络相关<br/>
LuCI ---> Applications ---> luci-app-clamav             #ClamAV杀毒软件<br/>
LuCI ---> Applications ---> luci-app-clash             #Clash客户端（Le库以外的插件）<br/>
LuCI ---> Applications ---> luci-app-commands             #Shell命令模块<br/>
LuCI ---> Applications ---> luci-app-cshark             #CloudShark捕获工具<br/>
LuCI ---> Applications ---> luci-app-dawn             #分布式AP管理程序<br/>
LuCI ---> Applications ---> luci-app-ddns   #动态域名 DNS（集成阿里DDNS客户端）<br/>
LuCI ---> Applications ---> luci-app-diag-core   #core诊断工具<br/>
LuCI ---> Applications ---> luci-app-diskman   #磁盘管理工具<br/>
    luci-app-diskman ---> Include btrfs-progs   #新型的写时复制 (COW)<br/>
    luci-app-diskman ---> Include lsblk   #lsblk命令 用于列出所有可用块设备的信息<br/>
    luci-app-diskman ---> Include mdadm   #mdadm命令 用于创建、管理、监控RAID设备的工具<br/>
    luci-app-diskman ---> Include kmod-md-raid456   #RAID 4,5,6 驱动程序模块（丢弃）<br/>
    luci-app-diskman ---> Include kmod-md-linear   #RAID 驱动程序模块（丢弃）<br/>
LuCI ---> Applications ---> luci-app-dnscrypt-proxy             #DNSCrypt解决DNS污染<br/>
LuCI ---> Applications ---> luci-app-dnsfilter             #DNSFilter基于DNS的广告过滤<br/>
LuCI ---> Applications ---> luci-app-dnsforwarder             #DNSForwarder防DNS污染<br/>
LuCI ---> Applications ---> luci-app-dnspod             #DNSPod动态域名解析（丢弃）<br/>
LuCI ---> Applications ---> luci-app-docker             #Docker容器LuCI ---> Applications ---> luci-app-dockerman             #Dockerman容器  *<br/>
LuCI ---> Applications ---> luci-app-dump1090             #民航无线频率（不确定）<br/>
LuCI ---> Applications ---> luci-app-dynapoint             #DynaPoint（未知）<br/>
LuCI ---> Applications ---> luci-app-e2guardian   #Web内容过滤器<br/>
LuCI ---> Applications ---> luci-app-easymesh   #简单MESH(可有线+无线回程)<br/>
LuCI ---> Applications ---> luci-app-eqos             #基于IP地址限速（Le库以外的插件）<br/>
LuCI ---> Applications ---> luci-app-familycloud   #家庭云盘<br/>
LuCI ---> Applications ---> luci-app-fileassistant   #文件管理助手（Le库以外的插件）<br/>
LuCI ---> Applications ---> luci-app-filetransfer             #文件传输（可web安装ipk包）<br/>
LuCI ---> Applications ---> luci-app-firewall   #添加防火墙<br/>
LuCI ---> Applications ---> luci-app-flowoffload             #Turbo ACC网络加速（集成FLOW,BBR,NAT,DNS（丢弃，移至TurboACC）<br/>
LuCI ---> Applications ---> luci-app-freifunk-diagnostics   #freifunk组件 诊断（未知）（丢弃）<br/>
LuCI ---> Applications ---> luci-app-freifunk-policyrouting             #freifunk组件 策略路由（未知）（丢弃）<br/>
LuCI ---> Applications ---> luci-app-freifunk-widgets             #freifunk组件 索引（未知）（丢弃）<br/>
LuCI ---> Applications ---> luci-app-frpc   #内网穿透Frp客户端<br/>
LuCI ---> Applications ---> luci-app-frps   #内网穿透Frp服务端<br/>
LuCI ---> Applications ---> luci-app-fwknopd             #Firewall Knock Operator服务器<br/>
LuCI ---> Applications ---> luci-app-guest-wifi   #WiFi访客网络<br/>
LuCI ---> Applications ---> luci-app-gfwlist   #GFW域名列表（丢弃）<br/>
LuCI ---> Applications ---> luci-app-go-aliyundrive-webdav   #阿里云盘webdav协议(文件管理/同步等)  *<br/>
LuCI ---> Applications ---> luci-app-gost             #隐蔽的https代理（Le库以外的插件）<br/>
LuCI ---> Applications ---> luci-app-haproxy-tcp   #HAProxy负载均衡-TCP<br/>
LuCI ---> Applications ---> luci-app-hd-idle             #硬盘休眠<br/>
LuCI ---> Applications ---> luci-app-hnet             #Homenet Status家庭网络控制协议<br/>
LuCI ---> Applications ---> luci-app-https-dns-proxy             #通过HTTPS代理为DNS提供Web UI<br/>
LuCI ---> Applications ---> luci-app-ipsec-server             #服务器 IPSec  *<br/>
LuCI ---> Applications ---> luci-app-ipsec-virtual**d             #virtual**服务器 IPSec<br/>
LuCI ---> Applications ---> luci-app-jd-dailybonus             #京东签到服务（丢弃）<br/>
LuCI ---> Applications ---> luci-app-kodexplorer             #KOD可道云私人网盘（与vnStat冲突 ! ）<br/>
LuCI ---> Applications ---> luci-app-kooldns             #VPN服务器 ddns替代方案（丢弃）<br/>
LuCI ---> Applications ---> luci-app-koolproxy             #KP去广告（丢弃）<br/>
LuCI ---> Applications ---> luci-app-lxc   #LXC容器管理<br/>
LuCI ---> Applications ---> luci-app-meshwizard #网络设置向导（丢弃）<br/>
LuCI ---> Applications ---> luci-app-minidlna   #完全兼容DLNA / UPnP-AV客户端的服务器软件<br/>
LuCI ---> Applications ---> luci-app-mjpg-streamer   #兼容Linux-UVC的摄像头程序<br/>
LuCI ---> Applications ---> luci-app-mosdns   #MosDNS转发器  *<br/>
LuCI ---> Applications ---> luci-app-mtwifi             #MTWiFi驱动的支持 （丢弃）<br/>
LuCI ---> Applications ---> luci-app-mmc-over-gpio   #添加SD卡操作界面（丢弃）<br/>
LuCI ---> Applications ---> luci-app-multiwan   #多拨虚拟网卡（丢弃，移至syncdial）<br/>
LuCI ---> Applications ---> luci-app-mwan   #MWAN负载均衡（丢弃）<br/>
LuCI ---> Applications ---> luci-app-music-remote-center   #PCHiFi 数字转盘遥控<br/>
LuCI ---> Applications ---> luci-app-mwan3   #MWAN3负载均衡<br/>
LuCI ---> Applications ---> luci-app-mwan3helper   #MWAN3分流助手<br/>
LuCI ---> Applications ---> luci-app-n2n_v2   #N2N内网穿透 N2N v2 VPN服务<br/>
LuCI ---> Applications ---> luci-app-netdata             #Netdata实时监控（图形化）<br/>
LuCI ---> Applications ---> luci-app-nfs   #NFS网络共享<br/>
LuCI ---> Applications ---> luci-app-nft-qos             #QOS流控 Nftables版<br/>
LuCI ---> Applications ---> luci-app-ngrokc             #Ngrok 内网穿透（丢弃）<br/>
LuCI ---> Applications ---> luci-app-nlbwmon   #网络带宽监视器<br/>
LuCI ---> Applications ---> luci-app-noddos             #NodDOS Clients 阻止DDoS攻击<br/>
LuCI ---> Applications ---> luci-app-nps   #内网穿透nps<br/>
LuCI ---> Applications ---> luci-app-ntpc   #NTP时间同步服务器<br/>
LuCI ---> Applications ---> luci-app-ocserv             #OpenConnect VPN服务<br/>
LuCI ---> Applications ---> luci-app-olsr             #OLSR配置和状态模块<br/>
LuCI ---> Applications ---> luci-app-olsr-services             #OLSR服务器<br/>
LuCI ---> Applications ---> luci-app-olsr-viz   #OLSR可视化<br/>
LuCI ---> Applications ---> luci-app-ocserv   #OpenConnect VPN服务（丢弃）<br/>
LuCI ---> Applications ---> luci-app-omcproxy             #嵌入式IGMPv3和MLDv2组播代理  *<br/>
LuCI ---> Applications ---> luci-app-openclash             #运行在OpenWrt上的Clash代理客户端（Le库以外的插件）<br/>
LuCI ---> Applications ---> luci-app-openvpn             #OpenVPN客户端<br/>
LuCI ---> Applications ---> luci-app-openvpn-server             #易于使用的OpenVPN服务器 Web-UI<br/>
LuCI ---> Applications ---> luci-app-oscam   #OSCAM服务器（丢弃）<br/>
LuCI ---> Applications ---> luci-app-p910nd   #打印服务器模块<br/>
LuCI ---> Applications ---> luci-app-pagekitec   #Pagekitec内网穿透客户端<br/>
LuCI ---> Applications ---> luci-app-passwall             #科学上网（Li大佬插件）<br/>
    Configuration ---> Include Brook             #Brook代理(跨平台强加密且不可检测代理)<br/>
    Configuration ---> Include ChinaDNS-NG             #防污染DNS服务<br/>
    Configuration ---> Include Haproxy             #HAProxy             #HAProxy负载均衡<br/>
    Configuration ---> Include Hysteria             #Hysteria双边加速工具<br/>
    Configuration ---> Include Kcptun             #Kcptun双边加速工具<br/>
    Configuration ---> Include NaiveProxy             #NaiveProxy代理(Chrome网络堆栈伪装流量)<br/>
    Configuration ---> Include PDNSD             #DNS服务器<br/>
    Configuration ---> Include Shadowsocks Libev Client             #SS Libev客户端(轻量级)<br/>
    Configuration ---> Include Shadowsocks Libev Server             #SS Libev服务端(轻量级)<br/>
    Configuration ---> Include Shadowsocks Rust Client             #SS Rust客户端(负载均衡/探测延迟)<br/>
    Configuration ---> Include ShadowsocksR Libev Client             #SSR Libev客户端(轻量级)<br/>
    Configuration ---> Include ShadowsocksR Libev Server             #SSR Libev服务端(轻量级)<br/>
    Configuration ---> Include Simple-Obfs (Shadowsocks plugin)             #simple-Obfs简单混淆工具(Nginx)<br/>
    Configuration ---> Include Trojan_GO             #Trojan_GO代理(直接模仿协议HTTPS)<br/>
    Configuration ---> Include Trojan_Plus             #Trojan_Plus代理(直接模仿协议HTTPS)<br/>
    Configuration ---> Include V2ray             #V2Ray代理<br/>
    Configuration ---> Include v2ray-plugin (Shadowsocks plugin)             #SS V2ray插件(WebSocket+TLS )<br/>
    Configuration ---> Include Xray             #Xray代理(XTLS)<br/>
    Configuration ---> Include Xray-Plugin (Shadowsocks Plugin)             #SS Xray插件(WebSocket+TLS )   *<br/>
    Configuration ---> Include Dns2socks             #DNS服务器（丢弃）<br/>
    Configuration ---> Include Redsocks2             #Redsocks2代理(透明TCP定向Socks/HTTPS代理服务器)（丢弃）<br/>
    Configuration ---> Include Shadowsocks             #SS代理（丢弃）<br/>
    Configuration ---> Include Shadowsocks Server             #SS服务器（丢弃）<br/>
    Configuration ---> Include Shadowsocks Rust (AEAD ciphers only)             #SS-RUST代理(AEAD加密)（丢弃）<br/>
    Configuration ---> Include ShadowsocksR   #SSR代理（丢弃）<br/>
    Configuration ---> Include ShadowsocksR Server             #SSR服务器（丢弃）<br/>
    Configuration ---> Include Https DNS Proxy(DoH)             #HttpsDNS服务（丢弃）<br/>
LuCI ---> Applications ---> luci-app-pgyvirtual**             #蒲公英virtual**   *<br/>
LuCI ---> Applications ---> luci-app-phtunnel             #花生壳PHTunnel内网穿透   *<br/>
LuCI ---> Applications ---> luci-app-polipo             #Polipo代理(是一个小型且快速的网页缓存代理)<br/>
LuCI ---> Applications ---> luci-app-pppoe-relay             #PPPoE NAT穿透 点对点协议（PPP）<br/>
LuCI ---> Applications ---> luci-app-pptp-server             #VPN服务器 PPTP<br/>
LuCI ---> Applications ---> luci-app-privoxy             #Privoxy网络代理(带过滤无缓存)<br/>
LuCI ---> Applications ---> luci-app-ps3netsrv             #PS3 NET服务器(用于加载蓝光/游戏ISO/PKG)<br/>
LuCI ---> Applications ---> luci-app-pushbot             #全能推送(钉钉推送,企业微信推送,Bark,PushPlus推送)<br/>
LuCI ---> Applications ---> luci-app-qbittorrent             #BT下载工具(qBittorrent)<br/>
    Build Version Selection (Static Build)  ---> Static Build             #选择静态编译版本<br/>
    Build Version Selection (Static Build)  ---> Dynamic Build             #选择动态编译版本<br/>
LuCI ---> Applications ---> luci-app-qbittorrent-simple             #BT下载工具(qBittorrent)简化版   *<br/>
    Build Version Selection (Static Build)  ---> Static Build             #选择静态编译版本<br/>
    Build Version Selection (Static Build)  ---> Dynamic Build             #选择动态编译版本<br/>
LuCI ---> Applications ---> luci-app-qos   #流量服务质量(QoS)流控<br/>
LuCI ---> Applications ---> luci-app-radicale   #CalDAV/CardDAV同步工具<br/>
LuCI ---> Applications ---> luci-app-ramfree             #释放内存<br/>
LuCI ---> Applications ---> luci-app-rclone             #命令行云端同步工具<br/>
    Include rclone-webui             #Rclone界面<br/>
    Include rclone-ng (another webui)             #Rclone另一个界面<br/>
    Include fuse-utils (mount cloud storage)             #fuse-utils（挂载云存储）（丢弃）<br/>
LuCI ---> Applications ---> luci-app-rp-pppoe-server             #Roaring Penguin PPPoE Server 服务器<br/>
LuCI ---> Applications ---> luci-app-samba   #网络共享（Samba）<br/>
LuCI ---> Applications ---> luci-app-samba4   #网络共享（Samba4）<br/>
LuCI ---> Applications ---> luci-app-serverchan   #微信/Telegram推送的插件<br/>
LuCI ---> Applications ---> luci-app-sfe             #Turbo ACC网络加速（丢弃，移至TurboACC）<br/>
LuCI ---> Applications ---> luci-app-shadowsocks   #SS科学上网（丢弃）<br/>
LuCI ---> Applications ---> luci-app-shadowsocks-libes             #SS-libev服务端<br/>
LuCI ---> Applications ---> luci-app-shairplay             #支持AirPlay功能<br/>
LuCI ---> Applications ---> luci-app-siitwizard             #SIIT配置向导  SIIT-Wizzard<br/>
LuCI ---> Applications ---> luci-app-simple-adblock             #简单的广告拦截<br/>
LuCI ---> Applications ---> luci-app-smartdns             #SmartDNS本地服务器<br/>
LuCI ---> Applications ---> luci-app-socat             #Socat多功能的网络工具(端口转发)   *<br/>
LuCI ---> Applications ---> luci-app-softethervpn             #SoftEther VPN服务器  NAT穿透<br/>
LuCI ---> Applications ---> luci-app-splash             #Client-Splash是无线MESH网络的一个热点认证系统<br/>
LuCI ---> Applications ---> luci-app-sqm             #流量智能队列管理（QOS）<br/>
LuCI ---> Applications ---> luci-app-squid   #Squid代理服务器<br/>
LuCI ---> Applications ---> luci-app-ssr-plus   #SSR科学上网Plus+（Le大佬插件）<br/>
    SS Client Selection (SS-libev)   ---> None             #不选  *<br/>
    SS Client Selection (SS-libev)   ---> SS-libev             #选择 SS Libev，C语言版(轻量级) *<br/>
    SS Client Selection (SS-libev)   ---> ssrust             #选择 SS rust，Rust语言版(负载均衡/探测延迟)  *<br/>
    SS Server Selection (SS-libev)   ---> None             #不选  *<br/>
    SS Server Selection (SS-libev)   ---> Shadowsocks-libev             #选择 Shadowsocks Libev，C语言版(轻量级)  *<br/>
    SS Server Selection (SS-libev)   ---> Shadowsocks-rust             #选择 Shadowsocks rust，Rust语言版(负载均衡/探测延迟)  *<br/>
    Shadowsocks-core Selection (Xray-core)  ---> None             #不选  *<br/>
    Shadowsocks-core Selection (Xray-core)  ---> Shadowsocks-core             #“Shadowsocks核心  *<br/>
    Shadowsocks-core Selection (Xray-core)  ---> Xray-core             #Xray核心  *<br/>
    Shadowsocks-core Selection (Xray-core)  ---> SagerNet-core             #Shadowsocks核心增强版  *<br/>
    luci-app-ssr-plus ---> Include Kcptun             #Kcptun双边加速工具<br/>
    luci-app-ssr-plus ---> Include Hysteria             #轻量代理-专为恶劣网络环境进行优化的网络工具(双边加速)  *<br/>
    luci-app-ssr-plus ---> Include IPT2Socks             #IPT2Socks轻量代理  *<br/>
    luci-app-ssr-plus ---> Include NaiveProxy             #NaiveProxy代理(Chrome网络堆栈伪装流量)<br/>
    luci-app-ssr-plus ---> Include Shadowsocks2             #Shadowsocks2代理(透明TCP定向Socks/HTTPS代理服务器)<br/>
    luci-app-ssr-plus ---> Include Simple-Obfs Plugin             #SS Simple-Obfs混淆代理(Nginx)<br/>
    luci-app-ssr-plus ---> Include SS Shadowsocks Plugin             #SS Shadowsocks代理(WebSocket+TLS )<br/>
    luci-app-ssr-plus ---> Include Shadowsocks Libev Client             #Shadowsocks Libev客户端(轻量级)<br/>
    luci-app-ssr-plus ---> Include Shadowsocks Libev Server             #Shadowsocks Libev服务端(轻量级)<br/>
    luci-app-ssr-plus ---> Include Trojan             #Trojan代理(直接模仿协议HTTPS)<br/>
    Include libustream-ssl  ---> Include libustream-wolfssl             #选择wolfSSL库(传输层安全协议)<br/>
    Include libustream-ssl  ---> Include libustream-openssl             #选择OpenSSL库(传输层安全协议)<br/>
    luci-app-ssr-plus ---> Include Kcptun             #Kcptun双边加速工具<br/>
    luci-app-ssr-plus ---> Include NaiveProxy             #NaiveProxy代理(Chrome网络堆栈伪装流量)<br/>
    luci-app-ssr-plus ---> Include Redsocks2             #Redsocks2代理(透明TCP定向Socks/HTTPS代理服务器)<br/>
    luci-app-ssr-plus ---> Include Shadowsocks Libev Client             #SS Libev客户端(轻量级)<br/>
    luci-app-ssr-plus ---> Include Shadowsocks Libev Server             #SS Libev服务端(轻量级)<br/>
    luci-app-ssr-plus ---> Include Shadowsocks Rust Client             #SS Rust客户端(负载均衡/探测延迟)<br/>
    luci-app-ssr-plus ---> Include Shadowsocks Rust Server             #SS Rust服务端(负载均衡/探测延迟)<br/>
    luci-app-ssr-plus ---> Include ShadowsocksR Libev Client             #SSR Libev客户端(轻量级)<br/>
    luci-app-ssr-plus ---> Include ShadowsocksR Libev Server             #SSR Libev服务端(轻量级)<br/>
    luci-app-ssr-plus ---> Include Simple-Obfs Plugin             #SS Simple-Obfs混淆代理(Nginx)<br/>
    luci-app-ssr-plus ---> Include Trojan             #Trojan代理(直接模仿协议HTTPS)<br/>
    luci-app-ssr-plus ---> Include Shadowsocks V2ray Plugin             #SS V2ray代理(WebSocket+TLS )<br/>
    luci-app-ssr-plus ---> Include Xray             #Xray代理(XTLS)<br/>
    luci-app-ssr-plus ---> Include Shadowsocks New Version             #新SS代理（丢弃）<br/>
    luci-app-ssr-plus ---> Include Shadowsocks             #SS代理（丢弃）<br/>
    luci-app-ssr-plus ---> Include Shadowsocks Rust (AEAD ciphers only)             #SS-RUST代理(AEAD密码)  （丢弃）<br/>
    luci-app-ssr-plus ---> Include V2ray             #V2Ray代理（丢弃）<br/>
    luci-app-ssr-plus ---> Include Xray (V2RAY/Trojan-GO implemented)             #Xray代理（丢弃）<br/>
    luci-app-ssr-plus ---> Include Trojan-go             #Trojan-go代理（丢弃）<br/>
    luci-app-ssr-plus ---> Include Shadowsocks Server             #SS服务器（丢弃）<br/>
    luci-app-ssr-plus ---> Include Shadowsocks Rust Server             #SS Rust服务器（丢弃）<br/>
    luci-app-ssr-plus ---> Include ShadowsocksR Server             #SSR服务器（丢弃）<br/>
    luci-app-ssr-plus ---> Include DNS2SOCKS             #DNS服务器（丢弃）<br/>
    luci-app-ssr-plus ---> Include ShadowsocksR Socks and Tunnel（丢弃）<br/>
    luci-app-ssr-plus ---> Include Socks Server             #socks代理服务器（丢弃）<br/>
LuCI ---> Applications ---> luci-app-ssr-pro             #SSR-Pro（丢弃）<br/>
LuCI ---> Applications ---> luci-app-ssrserver-python             #ShadowsocksR Python服务器<br/>
LuCI ---> Applications ---> luci-app-statistics             #流量监控工具<br/>
LuCI ---> Applications ---> luci-app-syncdial             #多拨虚拟网卡（原macvlan）<br/>
LuCI ---> Applications ---> luci-app-tinyproxy             #Tinyproxy是 HTTP(S)代理服务器<br/>
LuCI ---> Applications ---> luci-app-transmission   #BT下载工具<br/>
LuCI ---> Applications ---> luci-app-travelmate             #旅行路由器<br/>
LuCI ---> Applications ---> luci-app-ttyd     #网页终端命令行<br/>
LuCI ---> Applications ---> luci-app-turboacc       #Turbo ACC 网络加速(支持 Fast Path 或者 硬件 NAT)<br/>
    luci-app-turboacc ---> Include Flow Offload      #Flow Offload加速(提高路由转发效率)  *<br/>
    luci-app-turboacc ---> Include Shortcut-FE             #Shortcut-FE 流量分载<br/>
    luci-app-turboacc ---> Include Shortcut-FE CM   #Shortcut-FE 流量分载(高通芯片版)  *<br/>
    luci-app-turboacc ---> Include BBR CCA             #BBR拥塞控制算法提升TCP网络性能<br/>
    luci-app-turboacc ---> Include Pdnsd   #DNS防污染 Pdnsd  *<br/>
    luci-app-turboacc ---> Include DNSForwarder             #DNS防污染 Forwarder<br/>
    luci-app-turboacc ---> Include DNSProxy             #DNS防污染 Proxy<br/>
LuCI ---> Applications ---> luci-app-udpxy             #udpxy做组播服务器<br/>
LuCI ---> Applications ---> luci-app-uhttpd             #uHTTPd Web服务器<br/>
LuCI ---> Applications ---> luci-app-unblockmusic             #解锁网易云灰色歌曲3合1新版本<br/>
    UnblockNeteaseMusic Golang Version             #Golang版本<br/>
    UnblockNeteaseMusic NodeJS Version             #NodeJS版本<br/>
LuCI ---> Applications ---> luci-app-unblockneteasemusic-go             #解除网易云音乐（合并）<br/>
LuCI ---> Applications ---> luci-app-unblockneteasemusic-mini             #解除网易云音乐（合并）<br/>
LuCI ---> Applications ---> luci-app-unbound             #Unbound DNS解析器<br/>
LuCI ---> Applications ---> luci-app-upnp   #通用即插即用UPnP（端口自动转发）<br/>
LuCI ---> Applications ---> luci-app-usb-printer             #USB 打印服务器<br/>
LuCI ---> Applications ---> luci-app-uugamebooster             #UU网游加速器<br/>
LuCI ---> Applications ---> luci-app-v2ray-server   #V2Ray 服务器<br/>
LuCI ---> Applications ---> luci-app-v2ray-pro             #V2Ray透明代理（丢弃，集成SSR）<br/>
LuCI ---> Applications ---> luci-app-verysync             #微力同步<br/>
LuCI ---> Applications ---> luci-app-vlmcsd             #KMS服务器设置<br/>
LuCI ---> Applications ---> luci-app-vnstat   #vnStat网络监控（图表）（与kodexplorer冲突 ! ）<br/>
LuCI ---> Applications ---> luci-app-vpnbypass             #VPN BypassWebUI  绕过VPN设置<br/>
LuCI ---> Applications ---> luci-app-vsftpd             #FTP服务器<br/>
LuCI ---> Applications ---> luci-app-vssr             #VSSR科学上网（je大佬插件）<br/>
    luci-app-vssr ---> Include Xray             #Xray代理(XTLS)<br/>
    luci-app-vssr ---> Include Trojan             #Trojan代理(直接模仿协议HTTPS)<br/>
    luci-app-vssr ---> Include Kcptun             #Kcptun双边加速工具<br/>
    luci-app-vssr ---> Include Shadowsocks Xray Plugin             #SS Xray代理<br/>
    luci-app-vssr ---> Include ShadowsocksR Libev Server             #SSR Libev服务端(轻量级)<br/>
LuCI ---> Applications ---> luci-app-watchcat             #断网检测功能与定时重启<br/>
LuCI ---> Applications ---> luci-app-webadmin             #Web管理页面设置<br/>
LuCI ---> Applications ---> luci-app-webdav             #WebDAV阿里云盘  *<br/>
LuCI ---> Applications ---> luci-app-webshell             #网页命令行终端（丢弃）<br/>
LuCI ---> Applications ---> luci-app-wifischedule             #WiFi 计划<br/>
LuCI ---> Applications ---> luci-app-wireguard             #VPN服务器 WireGuard状态<br/>
LuCI ---> Applications ---> luci-app-wireless-regdb             #WiFi无线<br/>
LuCI ---> Applications ---> luci-app-wol   #WOL网络唤醒<br/>
LuCI ---> Applications ---> luci-app-wrtbwmon             #实时流量监测<br/>
LuCI ---> Applications ---> luci-app-xlnetacc             #迅雷快鸟<br/>
LuCI ---> Applications ---> luci-app-zerotier             #ZeroTier内网穿透<br/>
----------------------------------------------------------------------------------------<br/>
转载的时候请注明出处（https://www.right.com.cn/forum/thread-344825-1-1.html）<br/>
支持 iPv6：<br/>
1、Extra packages  --->  ipv6helper  （选定这个后下面几项自动选择了）<br/>
Network  --->  odhcp6c<br/>
Network  --->  odhcpd-ipv6only<br/>
LuCI  --->  Protocols  --->  luci-proto-ipv6<br/>
LuCI  --->  Protocols  --->  luci-proto-ppp<br/>
<br/>
2、打开适用于VMware的VM Tools<br/>
Utilities  --->  open-vm-tools             #打开适用于VMware的VM Tools<br/>
Utilities  --->  open-vm-tools-fuse             #打开适用于VMware的VM Tools<br/>
3、第二次编译：<br/>
cd lede                                                                               # 进入LEDE目录<br/>
git pull                                                                                           # 同步更新L大源码<br/>
./scripts/feeds update -a && ./scripts/feeds install -a               # 更新Feeds<br/>
rm -rf ./tmp && rm -rf .config                                                          # 清除编译配置和缓存<br/>
make menuconfig                                                                # 进入编译配置菜单<br/>
make -jn V=99                                                                               # 开始编译 n=线程数+1，例如4线程的I5填-j5<br/>
4、编译丰富插件时，建议修改下面两项默认大小，留足插件空间。（x86/64）！！！<br/>
Target Images ---> (16) Kernel partition size (in MB)                        #默认是 (16) 建议修改 (256)<br/>
Target Images ---> (160) Root filesystem partition size (in MB)                   #默认是 (160) 建议修改 (512)<br/>

</details>








