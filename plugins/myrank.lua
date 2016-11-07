local function run(msg,matches)
if matches[1] == 'setmyrank' then 
if string.len(matches[2]) > 20 and not is_sudo(msg) then 
return 'Only 20 charecters!' 
end 
if msg.text then 
if msg.text:lower():match('developer') and not is_sudo(msg) then 
return 'You cannot set your rank to developer!' 
end 
end 
local id = msg.from.id 
redis:hset('rank:user',id,matches[2]) 
return 'Your rank has been seted' 
end 
if matches[1] == 'myrank' then 
local id = msg.from.id 
local rank = redis:hget('rank:user',id) 
reply_msg(msg.id,rank,ok_cb,false) 
if not rank then 
return 'You dont have any rank!' 
end 
end
end

return {
patterns = {
'^[#!/]([Ss]etmyrank) (.*)$',
'^[#!/]([Mm]yrank)$',
},
run = run,
}

--By @Makan
--Channel: @MoonsTeam
