do

function run(msg)
	local uptime = io.popen('uptime'):read('*all')
	local rates = uptime:split("up")
	local rates1 = uptime:split(",")
	local rates1 = rates1[2]
	local rates = rates[2]
	local rates = rates:split(",  load")
	local rates = rates[1]
	local data = load_data(_config.moderation.data)
	local adminslist = ''
	for k,v in pairs(data['admins']) do
		adminslist = adminslist .. '> @'.. v ..'\n'
	end
	local settings = data[tostring("1067220916")]['settings']
	local group_link = data[tostring("1067220916")]['settings']['set_link']
	return 'Server information :\n'
		..'Uptime: '..rates..' days'..rates1..' hours'..'\n'
		..'Redline hetzern\n'
		..'CPU : 2 Core\n'
		..'RAM : 4 GB\n'
		..'HDD : 2 x 4 TB\n'
		..'IPN : 4 MB/S\n'
		..'Port : 1 MB/s\n______________________________\n\n'
		..'Group rates with @TeleMoon:\n'
		..'Weekly = 2T\n'
		..'Monthly = 3T\n'
		..'Unlimited = 5T\n______________________________\n\n'
		..'Developers:\n'
		..'Sudo: @Makan\n'
		..'Admins:\n'..adminslist..'______________________________\n\n'
		..'Contact us:\n'
		..'WebSite: www.MoonTeam.ir\n'
		..'Channel: https://telegram.me/MoonsTeam\n'
		..'Support:\n'..group_link
end

return {
	description = "Moon Bot!", 
	usage = "TeleMoon",
	patterns = {
                "^[#!/][Mm]oon$"
	}, 
	run = run 
}
end
