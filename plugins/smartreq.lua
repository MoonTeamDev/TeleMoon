local function run(msg, matches)
if matches[1] == 'req' then
local hash = 'Group req:'..msg.from.id
     redis:set(hash, "waite")
      return '🔖User ('..msg.from.username..')\nWhat do you want?\nGroup for>\nWeekly\nMonthly\nUnlimited\n\nIf you want unlimited group send (unlimited)\nFor monthly group send (monthly)\nFor weekly group send (weekly)\n\nGood Luck ^_^\n@MoonsTeam'
    end

    if msg.text then
	local hash = 'Group req:'..msg.from.id
      if msg.text:match("^weekly$") and redis:get(hash) == "waite" then
	  redis:set(hash, "ok")
	elseif msg.text:match("^monthly$") and redis:get(hash) == "waite" then
	  redis:set(hash, "ok")
    elseif msg.text:match("^unlimited$") and redis:get(hash) == "waite" then
	  redis:set(hash, "ok")

      end
    end
	local text = "Hey makan! You have new req from :"..msg.from.id.." ="
	local hash = 'Group req:'..msg.from.id
	 if redis:get(hash) then
        if redis:get(hash) == "ok" then
		send_large_msg('channel#id90285047', text, ok_cb, false)
         return 'Your req will be check!'
        end
      end
    end

return {
  patterns = {
  "[!/#]req",
  "^[Ww]eek$",
  "^[Mm]onth$",
  "^[Uu]nlimited$"
  },
  run = run,
}
