do
local function info_reply(extra,success,result)
local msg = result
local username = 'ندارد'
local first = '----'
local last = '----'
local phone = '----'
if msg.from.username then
username = '@'..msg.from.username
end
if msg.from.first_name then
first = msg.from.first_name
end
if msg.from.last_name then
last = msg.from.last_name
end
if msg.from.phone then
phone = '+'..string.gsub(tostring(msg.from.phone),string.sub(tostring(msg.from.phone),-4),'****')
end
local info = 'نام : '..first..'\nفامیل : '..last..'\nیوزرنیم : '..username..'\n'..phone
send_msg(extra.receiver, info, ok_cb, false)
end
local function res_user_callback(extra, success, result)
if success == 1 then  
local msg = result
local username = 'ندارد'
local first = '----'
local last = '----'
local phone = '----'
if msg.username then
username = '@'..msg.username
end
if msg.first_name then
first = msg.first_name
end
if msg.last_name then
last = msg.last_name
end
if msg.phone then
phone = '+'..string.gsub(tostring(msg.phone),string.sub(tostring(msg.phone),-4),'****')
end
    local info = 'نام : '..first..'\nفامیل : '..last..'\nیوزرنیم : '..username..'\n'..phone
send_msg(extra.receiver, info, ok_cb, false)
      end
    end
local function action_by_id(extra, success, result)
if success == 1 then  
local msg = result
local username = 'ندارد'
local first = '----'
local last = '----'
local phone = '----'
if msg.username then
username = '@'..msg.username
end
if msg.first_name then
first = msg.first_name
end
if msg.last_name then
last = msg.last_name
end
if msg.phone then
phone = '+'..string.gsub(tostring(msg.phone),string.sub(tostring(msg.phone),-4),'****')
end
    local info = 'نام : '..first..'\nفامیل : '..last..'\nیوزرنیم : '..username..'\n'..phone
send_msg(extra.receiver, info, ok_cb, false)
      end
    end
function run(msg, matches)
local receiver = get_receiver(msg)
if matches[1]:lower() == 'number' then
if msg.reply_id then
get_message(msg.reply_id, info_reply, msg.id)
else
local username = 'ندارد'
local first = '----'
local last = '----'
local phone = '----'
if msg.from.username then
username = '@'..msg.from.username
end
if msg.from.first_name then
first = msg.from.first_name
end
if msg.from.last_name then
last = msg.from.last_name
end
if msg.from.phone then
phone = '+'..string.gsub(tostring(msg.from.phone),string.sub(tostring(msg.from.phone),-4),'****')
end
local info = 'نام : '..first..'\nفامیل : '..last..'\nیوزرنیم : '..username..'\n'..phone
send_msg(receiver, info, ok_cb, false)
end
end
if matches[1]:lower() == 'number' and matches[2] then
   local user = matches[2]
   local chat2 = msg.to.id
   if string.match(user, '^%d+$') then
    user_info('user#id'..user, action_by_id, {receiver=receiver, user=user, text=text, chat2=chat2})
    elseif string.match(user, '^@.+$') then
      username = string.gsub(user, '@', '')
      msgr = res_user(username, res_user_callback, {receiver=receiver, user=user, text=text, chat2=chat2})
   end
  end
end
return {
patterns = {
"^[!/#]([Nn]umber)",
"^[!/#]([Nn]umber) (.*)",
          
},
run = run
}
end      
