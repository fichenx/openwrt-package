#!/bin/sh /etc/rc.common
# Copyright (C) 2008-2022 OpenWrt.org

START=99
USE_PROCD=1

PROG=/usr/bin/msd_lite

gen_conf() {
		cat <<-EOF > /var/etc/msd_lite.conf
<?xml version="1.0" encoding="utf-8"?>
<msd>
	<log>
		<file>/var/log/msd_lite.log</file>
	</log>

	<threadPool>
		<threadsCountMax>${threads}</threadsCountMax> <!-- 0 = auto -->
		<fBindToCPU>yes</fBindToCPU> <!-- Bind threads to CPUs. -->
		<fCacheGetTimeSyscall>yes</fCacheGetTimeSyscall> <!-- Cache gettime() syscalls.. -->
		<timerGranularity>100</timerGranularity> <!-- 1/1000 sec -->
	</threadPool>


<!-- HTTP server -->
	<HTTP>
		<bindList>
			<bind><address>0.0.0.0:>${port}</address><fAcceptFilter>y</fAcceptFilter></bind>
			<bind><address>[::]:>${port}</address></bind>
		</bindList>

		<hostnameList> <!-- Host names for all bindings. -->
			<hostname>*</hostname>
		</hostnameList>
	</HTTP>


	<hubProfileList> <!-- Stream hub profiles templates. -->
		<hubProfile>
			<fDropSlowClients>no</fDropSlowClients> <!-- Disconnect slow clients. -->
			<fSocketHalfClosed>no</fSocketHalfClosed> <!-- Enable shutdown(SHUT_RD) for clients. -->
			<fSocketTCPNoDelay>yes</fSocketTCPNoDelay> <!-- Enable TCP_NODELAY for clients. -->
			<fSocketTCPNoPush>yes</fSocketTCPNoPush> <!-- Enable TCP_NOPUSH / TCP_CORK for clients. -->
			<precache>4096</precache> <!-- Pre cache size. Can be overwritten by arg from user request. -->
			<ringBufSize>1024</ringBufSize> <!-- Stream receive ring buffer size. Must be multiple of sndBlockSize. -->
			<skt>
				<sndBuf>512</sndBuf> <!-- Max send block size, apply to clients sockets only, must be > sndBlockSize. -->
				<sndLoWatermark>64</sndLoWatermark>  <!-- Send block size. Must be multiple of 4. -->
				<congestionControl>htcp</congestionControl> <!-- TCP_CONGESTION: this value replace/overwrite(!) all others cc settings: cc from http req args, http server settings, OS default -->
			</skt>
			<headersList> <!-- Custom HTTP headers (sended before stream). -->
				<header>Pragma: no-cache</header>
				<header>Content-Type: video/mpeg</header>
				<header>ContentFeatures.DLNA.ORG: DLNA.ORG_OP=01;DLNA.ORG_CI=0;DLNA.ORG_FLAGS=01700000000000000000000000000000</header>
				<header>TransferMode.DLNA.ORG: Streaming</header>
			</headersList>
		</hubProfile>
	</hubProfileList>


	<sourceProfileList> <!-- Stream source profiles templates. -->
		<sourceProfile>
			<skt>
				<rcvBuf>512</rcvBuf> <!-- Multicast recv socket buf size. -->
				<rcvLoWatermark>48</rcvLoWatermark> <!-- Actual cli_snd_block_min if polling is off. -->
				<rcvTimeout>2</rcvTimeout> <!-- STATUS, Multicast recv timeout. -->
			</skt>
			<multicast> <!-- For: multicast-udp and multicast-udp-rtp. -->
				<ifName>${source}</ifName> <!-- For multicast receive. -->
				<rejoinTime>${rejointime}</rejoinTime> <!-- Do IGMP/MLD leave+join every X seconds. -->
			</multicast>
		</sourceProfile>
	</sourceProfileList>
</msd>
		EOF
}

start_service() {
	config_load "msd_lite"
	
	config_get "port" "config" "port"
	config_get "source" "config" "source"
	config_get "threads" "config" "threads"
	config_get "rejointime" "config" "rejointime"
	
	local enable
	config_get_bool enable config enable 0
	
	[ "${enable}" -gt 0 ] || return
	
	gen_conf

	procd_open_instance
	procd_set_param command $PROG -c /var/etc/msd_lite.conf
	procd_set_param respawn
	procd_close_instance
}
