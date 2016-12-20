local function run(msg, matches) 
if matches[1] == "setpm" then 
if not is_sudo(msg) then 
return 'Sudo only!' 
end 
local pm = matches[2] 
redis:set('bot:pm',pm) 
return 'Pm has been seted!' 
end 

if matches[1] == "pm" and is_sudo(msg) then
local hash = ('bot:pm') 
    local pm = redis:get(hash) 
    if not pm then 
    return 'Pm is not set!' 
    else 
    reply_msg(msg.id, 'Pm:\n\n'..pm, ok_cb, false)
    end
end

if matches[1] == "pm" then 
if not is_sudo(msg) then 
return 'Sudo only!' 
end 
if matches[2]=="on"then 
redis:set("bot:pm", "no pm")
return "Auto send pm is on now" 
end 
if matches[2]=="off"then 
redis:del("bot:pm")
return "Auto send pm is off now" 
end
 end

  if msg.to.type == "user" and msg.text then
    local hash = ('bot:pm') 
    local pm = redis:get(hash)
if msg.from.id == 90285047 or msg.to.type == 'channel' or msg.to.type == 'chat' then
return
else
    reply_msg(msg.id, pm, ok_cb, false)
    end 
    end
end
return { 
patterns ={ 
"^[!#/](setpm) (.*)$", 
"^[!#/](pm) (on)$", 
"^[!#/](pm) (off)$", 
"^[!#/](pm)$", 
"^(.*)$", 
}, 
run = run 
}
--by @MoonsTeam , @Makan
