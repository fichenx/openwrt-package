module("luci.controller.msd_lite", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/msd_lite") then
		return
	end

	entry({"admin", "services", "msd_lite"}, alias("admin", "services", "msd_lite", "general"), _("Multi Stream Daemon"), 80)
	entry({"admin", "services", "msd_lite", "general"}, cbi("msd_lite/settings"), _("Base Setting"), 1)
	entry({"admin", "services", "msd_lite", "log"}, form("msd_lite/info"), _("Log"), 2)

	entry({"admin", "services", "msd_lite", "status"}, call("status")).leaf = true
end

function status()
	local e = {}
	e.running = luci.sys.call("pgrep msd_lite >/dev/null") == 0
	luci.http.prepare_content("application/json")
	luci.http.write_json(e)
end

