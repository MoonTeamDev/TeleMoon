 local function run(msg, matches) 
if matches[1] == "setchannel" then 
if not is_admin1(msg) then 
return 'You,re not admin' 
end 
local channel = matches[2] 
redis:set('bot:channel',channel) 
return 'Channel has been seted' 
end 
if matches[1] == 'channel' then 
if not is_momod(msg) then 
return 'Only for mod/owners!
end 
    local hash = ('bot:channel') 
    local channel = redis:get(hash) 
    if not channel then 
    return 'Channel is not seted' 
    else 
    reply_msg(msg.id, channel, ok_cb, false) 
    end 
    end 
if matches[1] == 'delchannel' then 
if not is_admin1(msg) then 
return 'You,re not admin' 
end 
    local hash = ('bot:channel') 
    redis:del(hash) 
return 'Channel has been deleted' 
end 
end 
return { 
patterns ={ 
"^[!#/](setchannel) (.*)$", 
"^[!#/](channel)$", 
"^[!#/](delchannel)$", 
}, 
run = run 
} 
-- by @Makan
-- channel: @MoonsTeam
