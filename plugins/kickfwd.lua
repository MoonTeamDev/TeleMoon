local function run(msg, matches)
local hash = 'kmember:'..msg.to.id
    if matches[1] == 'kmember' and is_momod(msg) and redis:get(hash) == nil then
           redis:set(hash, "waite")
           return send_large_msg(get_receiver(msg), 'Ok! Now fwd the one of member's pm if you want to kick him')
	elseif matches[1] == 'kmember' and is_momod(msg) and redis:get(hash) == "waite" then
	       return send_large_msg(get_receiver(msg),"You have request befor! Fwd the one of member's pm if you want to kick him" )
 end
end

local function pre_process(msg)
local hash = 'kmember:'..msg.to.id
local service = msg.service
	if msg.fwd_from and is_momod(msg) then
	  if redis:get(hash) then
	     if redis:get(hash) == "waite" then
		 if is_momod2(msg.fwd_from.peer_id) then
		 return send_large_msg(get_receiver(msg), 'You cant kick mods/owner!')
		 end
	     redis:del(hash, true)
         kick_user(msg.fwd_from.peer_id, msg.to.id)
         return send_large_msg(get_receiver(msg), 'User '..msg.fwd_from.peer_id..' has been kicked from ('..msg.to.title..') ❌')
        end
	  end
	end
	return msg
end

return {
	patterns = {
	"^[!#/](kmember)$",
	},
	run = run,
	pre_process = pre_process,
}
