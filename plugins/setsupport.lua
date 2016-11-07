 local function run(msg, matches) 
if matches[1] == "setsupport" then 
if not is_admin1(msg) then 
return 'You,re not admin' 
end 
local support = matches[2] 
redis:set('bot:support',support) 
return 'Support has been seted' 
end 
if matches[1] == 'support' then 
if not is_momod(msg) then 
return 
end 
    local hash = ('bot:support') 
    local support = redis:get(hash) 
    if not support then 
    return 'Support is not seted' 
    else 
    reply_msg(msg.id, support, ok_cb, false) 
    end 
    end 
if matches[1] == 'delsupport' then 
if not is_admin1(msg) then 
return 'You,re not admin' 
end 
    local hash = ('bot:support') 
    redis:del(hash) 
return 'Support has been deleted' 
end 
end 
return { 
patterns ={ 
"^[!#/](setsupport) (.*)$", 
"^[!#/](support)$", 
"^[!#/](delsupport)$", 
}, 
run = run 
} 
-- by @Makan
-- channel: @MoonsTeam
