local admin = 90285047,

function run(msg, matches)
local hash = 'PvSensitivy'..msg.from.id

if is_admin(msg) then

if matches[1] == 'pvflood' and matches[2] then
	redis:set('maxpv', matches[2])
	return 'Pv Flood Set To '..matches[2]
end

else

if msg.to.type == 'user' then
	redis:incr(hash)
end

end
end

local function pre_process(msg)
local hash = 'PvSensitivy'..msg.from.id
	if is_admin(msg) then return false end

	local max = ''

	if redis:get('maxpv') then
		max = redis:get('maxpv')
	else
		max = 5
	end
	
	if redis:get(hash) > max then
		block_user("user#id"..msg.from.id,ok_cb,false)
		send_large_msg("user#id"..tonumber(admin),'User '..msg.from.id..' Blocked For Spamming In Pv!')
	end
end

return {
 description = "pvflood",
 patterns = {
	'^[!/#](pvflood) (%d+)$',
	'^(.*)$'
 },
 pre_process = pre_process,
 run = run
}
