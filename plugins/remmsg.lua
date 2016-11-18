local function history(extra, suc, result)
for i=1, #result do
delete_msg(result[i].id, ok_cb, false)
end
if tonumber(extra.con) == #result then
send_msg(extra.chatid, ''..#result..' Deleted', ok_cb, false)
else
send_msg(extra.chatid, 'Done!', ok_cb, false)
end
end
local function run(msg, matches)
elseif matches[1] == 'remmsg' and is_sudo(msg) then
            if msg.to.type == 'channel' then
            if tonumber(matches[2]) > 9999 or tonumber(matches[2]) < 1 then
            return "Error!"
            end
            get_history(msg.to.peer_id, matches[2] + 1 , history , {chatid = msg.to.peer_id, con = matches[2]})
        else
                         return "Only for supergroup"
        end
else
return "Only for sudo!"
end
if matches[1] == 'remmsg' and is_owner(msg) then
            if msg.to.type == 'channel' then
            if tonumber(matches[2]) > 999 or tonumber(matches[2]) < 1 then
            return "Error! +999 only for sudo."
            end
            get_history(msg.to.peer_id, matches[2] + 1 , history , {chatid = msg.to.peer_id, con = matches[2]})
        else
                         return "Only for supergroup"
        end
else
return "Only for owner!"
end
end
return {
    patterns = {
        '^[!/#](remmsg) (%d*)$'
    },
    run = run
}
