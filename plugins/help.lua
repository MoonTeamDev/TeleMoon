do 
function pairsByKeys(t, f)
	local a = {}
	for n in pairs(t) do
		table.insert(a, n)
	end
	table.sort(a, f)
	local i = 0
	local iter = function ()
		i = i + 1
		if a[i] == nil then
			return nil
		else
			return a[i], t[a[i]]
		end
	end
	return iter
end

local function has_usagehtm_data(dict)
	if (dict.usagehtm == nil or dict.usagehtm == '') then
		return false
	end
	return true
end

local function plugin_helphtm(name,number,requester)
	local plugin = ""
	if number then
		local i = 0
		for name in pairsByKeys(plugins) do
			if plugins[name].hidden then
				name = nil
			else
				i = i + 1
				if i == tonumber(number) then
					plugin = plugins[name]
				end
			end
		end
	else
		plugin = plugins[name]
		if not plugin then
			return nil
		end
	end
    local text = ""
    if (type(plugin.usagehtm) == "table") then
		for ku,usagehtm in pairs(plugin.usagehtm) do
			if ku == 'user' then
				if (type(plugin.usagehtm.user) == "table") then
					for k,v in pairs(plugin.usagehtm.user) do
						text = text..v..'\n'
					end
				elseif has_usagehtm_data(plugin) then
					text = text..plugin.usagehtm.user..'\n'
				end
			else
				text = text..usagehtm..'\n'
			end
		end
		text = text
	elseif has_usagehtm_data(plugin) then
		text = text..plugin.usagehtm
    end
    return text
end

local function help_all(requester)
	local ret = ""
	for name in pairsByKeys(plugins) do
		if plugins[name].hidden then
			name = nil
		else
			ret = ret .. plugin_helphtm(name, nil, requester)
		end
	end
	local htmlhelp = '<html><head><title>TeleMoon</title></head><body><center>'
	..'<font size=1 ><Pre><font color=#FFFFFF>@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@<br>'
	..'@@@@@@@@@@@@@@</font><font color=#000000>@@</font><font color=#FF0000>@@@@@@@@@@</font><font color=#000000>@@</font><font color=#FFFFFF>@@@@@@@@@@@@<br>'
	..'@@@@@@@@@@</font><font color=#000000>@@@@@@</font><font color=#FF0000>@@</font><font color=#FF0000>@@@@@@</font><font color=#FF0000>@@</font><font color=#000000>@@@@@@</font><font color=#FFFFFF>@@@@@@@@<br>'
	..'@@@@@@</font><font color=#3D0000>@@</font><font color=#000000>@@@@@@@@@@</font><font color=#FF0000>@@@@@@</font><font color=#000000>@@@@@@@@@@</font><font color=#FF0000>@@</font><font color=#FFFFFF>@@@@<br>'
	..'@@@@@@</font><font color=#FF0000>@@</font><font color=#410000>@@</font><font color=#000000>@@@@@@@@</font><font color=#FD0000>@@</font><font color=#FF0000>@@@@</font><font color=#000000>@@@@@@@@</font><font color=#FF0000>@@</font><font color=#FF0000>@@</font><font color=#FFFFFF>@@@@<br>'
	..'@@@@</font><font color=#FF0000>@@@@@@</font><font color=#460000>@@</font><font color=#000000>@@</font><font color=#060606>@@</font><font color=#000000>@@</font><font color=#FF0000>@@@@@@</font><font color=#000000>@@</font><font color=#000000>@@</font><font color=#000000>@@</font><font color=#FF0000>@@</font><font color=#FF0000>@@@@@@</font><font color=#FFFFFF>@@<br>'
	..'@@@@</font><font color=#FF0000>@@@@@@@@</font><font color=#510000>@@</font><font color=#000000>@@@@</font><font color=#FF0000>@@</font><font color=#FF0000>@@</font><font color=#FF0000>@@</font><font color=#000000>@@@@</font><font color=#000800>@@</font><font color=#FF0000>@@@@@@@@</font><font color=#FFFFFF>@@<br>'
	..'@@</font><font color=#FF0000>@@@@@@@@</font><font color=#FF0008>@@</font><font color=#FF0000>@@</font><font color=#5E0000>@@</font><font color=#000000>@@@@</font><font color=#FF0000>@@</font><font color=#000000>@@@@</font><font color=#5C0000>@@</font><font color=#FF0000>@@</font><font color=#FF0008>@@</font><font color=#FF0000>@@@@@@@@<br>'
	..'</font><font color=#FFFFFF>@@</font><font color=#000000>@@</font><font color=#000000>@@</font><font color=#FF0000>@@@@@@@@@@</font><font color=#B4000F>@@</font><font color=#000000>@@</font><font color=#FF0000>@@</font><font color=#000000>@@</font><font color=#530008>@@</font><font color=#FF0000>@@@@@@@@@@</font><font color=#000000>@@</font><font color=#000000>@@<br>'
	..'</font><font color=#FFFFFF>@@</font><font color=#000000>@@@@@@</font><font color=#000000>@@</font><font color=#000000>@@</font><font color=#000000>@@</font><font color=#FF0000>@@@@</font><font color=#750000>@@</font><font color=#FF0000>@@</font><font color=#4F0000>@@</font><font color=#FF0000>@@@@</font><font color=#000000>@@</font><font color=#000000>@@</font><font color=#000000>@@</font><font color=#000000>@@@@@@<br>'
	..'</font><font color=#FFFFFF>@@</font><font color=#000000>@@@@@@@@@@@@@@@@@@</font><font color=#480000>@@</font><font color=#000000>@@@@@@@@@@@@@@@@@@<br>'
	..'</font><font color=#FFFFFF>@@</font><font color=#000000>@@@@@@@@@@</font><font color=#000000>@@</font><font color=#FF0000>@@@@</font><font color=#9B0000>@@</font><font color=#FF0000>@@</font><font color=#750000>@@</font><font color=#FF0000>@@@@</font><font color=#000000>@@</font><font color=#000000>@@</font><font color=#000000>@@</font><font color=#000000>@@@@@@<br>'
	..'</font><font color=#FFFFFF>@@</font><font color=#000000>@@</font><font color=#000000>@@</font><font color=#FF0000>@@@@@@@@@@</font><font color=#EB0008>@@</font><font color=#000000>@@</font><font color=#FF0000>@@</font><font color=#000000>@@</font><font color=#860000>@@</font><font color=#FF0000>@@@@@@@@@@</font><font color=#000000>@@</font><font color=#000000>@@<br>'
	..'</font><font color=#FFFFFF>@@</font><font color=#FF0000>@@@@@@@@</font><font color=#FF0000>@@</font><font color=#FF0000>@@</font><font color=#5F0000>@@</font><font color=#000000>@@@@</font><font color=#FF0000>@@</font><font color=#000000>@@@@</font><font color=#5E0000>@@</font><font color=#FF0000>@@</font><font color=#FF0000>@@</font><font color=#FF0000>@@@@@@@@<br>'
	..'</font><font color=#FFFFFF>@@@@</font><font color=#FF0000>@@@@@@@@</font><font color=#FF0000>@@</font><font color=#000000>@@@@</font><font color=#FF0000>@@</font><font color=#FF0000>@@</font><font color=#FF0000>@@</font><font color=#000000>@@@@</font><font color=#510000>@@</font><font color=#FF0000>@@@@@@@@</font><font color=#FFFFFF>@@<br>'
	..'@@@@</font><font color=#FF0000>@@@@@@</font><font color=#000300>@@</font><font color=#000000>@@</font><font color=#060606>@@</font><font color=#000000>@@</font><font color=#FF0000>@@@@@@</font><font color=#000000>@@</font><font color=#000000>@@</font><font color=#000000>@@</font><font color=#4A0000>@@</font><font color=#FF0000>@@@@@@</font><font color=#FFFFFF>@@<br>'
	..'@@@@@@</font><font color=#FF0000>@@</font><font color=#000000>@@</font><font color=#000000>@@@@@@@@</font><font color=#CB0000>@@</font><font color=#FF0000>@@</font><font color=#A40000>@@</font><font color=#000000>@@@@@@@@</font><font color=#3C0000>@@</font><font color=#FF0000>@@</font><font color=#FFFFFF>@@@@<br>'
	..'@@@@@@</font><font color=#000000>@@</font><font color=#000000>@@@@@@@@@@</font><font color=#FF0000>@@@@@@</font><font color=#000000>@@@@@@@@@@</font><font color=#410000>@@</font><font color=#FFFFFF>@@@@<br>'
	..'@@@@@@@@@@</font><font color=#000000>@@@@@@</font><font color=#FF0000>@@</font><font color=#FF0000>@@@@@@</font><font color=#FF0000>@@</font><font color=#000000>@@@@@@</font><font color=#FFFFFF>@@@@@@@@<br>'
	..'@@@@@@@@@@@@@@</font><font color=#000000>@@</font><font color=#FF0000>@@@@@@@@@@</font><font color=#000000>@@</font><font color=#FFFFFF>@@@@@@@@@@@@</font><br></Pre></font>'
	..'<font size=6 face=tahoma color=#ff0000><b>Pro Help for Umbrella Bot Plugins</b></font><br><br>'
	..'<center><font size=3 face=tahoma color=#000000><table width=800 border=1 cellSpacing=1 cellPadding=10><tr>'
	..'<td width="280" align="center" valign="middle"><b>دستور</b></td>'
	..'<td width="520" align="center" valign="middle"><b>توضيحات</b></td></tr>'..ret
	..'</table><br><br></font><font size=3 face=tahoma><b>'
	..'<a href="http://umbrella.shayan-soft.ir" target="_blank">www.Umbrella.shayan-soft.ir</a><br>'
	..'<a href="https://telegram.me/umbrellateam" target="_blank">telegram.me/UmbrellaTeam</a>'
	..'</b></center></font><br></body></html>'
	local file = io.open("./file/Help.htm", "w")
	file:write(htmlhelp)
	file:flush()
	file:close() 
	return send_document(msgtoid,"./file/Help.htm", ok_cb, false)
end

local function run(msg, matches)
	msgtoid = 'chat#id'..msg.to.id
	requester = "user"
	return help_all(requester)
end
 
return {
	description = "HTML Help",
	patterns = {
		"^/help>",
	},
	run = run
} 
end
