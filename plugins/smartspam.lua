local function run(msg, matches)
if matches[1] == "setspam" then
if not is_sudo(msg) then
return 'Youre not sudo!'
end
local spam = matches[2]
redis:set('bot:spam',spam)
return 'Spam is not seted'
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
end
return {
patterns ={
"^[!#/](setspam) (.*)$",
"^[!#/](spam)$",
"^[!#/](delspam)$",
},
run = run
}
--by @MoonsTeam , @Makan
