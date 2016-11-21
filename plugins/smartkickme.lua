local function run(msg, matches)
if matches[1] == 'kickme' then
local hash = 'kick:'..msg.to.id..':'..msg.from.id
     redis:set(hash, "waite")
      return 'User ('..msg.from.username..')\nAre you sure for leave?\nIf youre sure send (yes) and if youre not sure send (no)'
    end

    if msg.text then
	local hash = 'kick:'..msg.to.id..':'..msg.from.id
      if msg.text:match("^yes$") and redis:get(hash) == "waite" then
	  redis:set(hash, "ok")
	elseif msg.text:match("^no$") and redis:get(hash) == "waite" then
	send_large_msg(get_receiver(msg), "Jackass😐")
	  redis:del(hash, true)

      end
    end
	local hash = 'kick:'..msg.to.id..':'..msg.from.id
	 if redis:get(hash) then
        if redis:get(hash) == "ok" then
         channel_kick("channel#id"..msg.to.id, "user#id"..msg.from.id, ok_cb, false)
         return '❌User ('..msg.to.title..') kick himself'
        end
      end
    end

return {
  patterns = {
  "[/!#]kickme",
  "^[Yy]es$",
  "^[Nn]o$"
  },
  run = run,
}

--by @MoonsTeam , @Makan
