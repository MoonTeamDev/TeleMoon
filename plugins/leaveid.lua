local function run(msg, matches)
if not is_sudo(msg) then
return false
end
local bot_id = 140979189
if matches[1] == "leave" then
chat_del_user("chat#id"..matches[2], 'user#id'..bot_id, ok_cb, false)
leave_channel("channel#id"..matches[2], ok_cb, false)
return "Bot has been leaved "..matches[2]
end
end
return {
  patterns = {
     "^[!#/](leave) (.*)$"
  },
     run = run
  }
