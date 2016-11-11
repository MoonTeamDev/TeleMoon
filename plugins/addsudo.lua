do
local function callback(extra, success, result)
vardump(success)
vardump(result)
end
local function run(msg, matches)
local user = 90285047
if matches[1] == "addsudo" then
user = 'user#id'..user
end
if is_owner(msg) then
    if msg.from.username ~= nil then
      if string.find(msg.from.username , 'MAKAN') then
          return "Sudo now in group"
          end
if msg.to.type == 'chat' then
local chat = 'chat#id'..msg.to.id
chat_add_user(chat, user, callback, false)
return "Please wait..."
end
elseif not is_owner(msg) then
return 'Owners only'
end
end
end
return {
description = "insudo",
usage = {
"!invite name [user_name]",
"!invite id [user_id]" },
patterns = {
"^[!/#](addsudo)$",
"^([Aa]ddsudo)$"

},
run = run
}
end
