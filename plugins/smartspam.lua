local function run(msg, matches)
if matches[1] == "setspam" then
if not is_sudo(msg) then
return 'Youre not sudo!'
end
local spam = matches[2]
redis:set('bot:spam',spam)
return ':|'
end
if matches[1] == 'spam' then
if not is_sudo(msg) then
return 'Sudoers only!'
end
    local hash = ('bot:spam')
    local spam = redis:get(hash)
    if not spam then
    return 'Spam is not seted!'
    else
    reply_msg(msg.id, spam, ok_cb, false)
    end
    end
if matches[1] == 'delspam' then
if not is_sudo(msg) then
return 'Sudoers only!'
end
    local hash = ('bot:spam')
    redis:del(hash)
return 'Spam has been deleted!'
end
local receiver = get_receiver(msg)
local hash = 'bot:spam'..receiver
     if matches[1] == 'spam' and is_sudo(msg) then
--Enable spam
     if matches[2] == 'on' then
    redis:del(hash)
   return 'spam has been enabled'
--Disable spam
     elseif matches[2] == 'off' then
    redis:set(hash, true)
   return 'spam has been disabled'
   --Spam Status
    elseif matches[2] == 'status' then
      if not redis:get(hash) then
   return 'spam is enable'
       else
   return 'spam is disable'
         end
      end
   end
end
return {
patterns ={
"^[!#/](setspam) (.*)$",
"^[!#/](spam)$",
"^[!#/](delspam)$",
"^[!#/](spam) (.*)$",
},
run = run
}
--by @MoonsTeam , @Makan
