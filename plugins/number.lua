do
local function info_reply(ex,suc,res)
if is_sudo(msg) then
local msg = res
local info = 'First name : '..(msg.from.first_name or '')..'\nLast name : '..(msg.from.last_name or '')..'\nUsername: @'..(msg.from.username or '')..'\nNumber: +'..(msg.from.phone or '')
reply_msg(ex, info, ok_cb, false)
end
end
function run(msg, matches)
if msg.reply_id then
get_message(msg.reply_id, info_reply, msg.id)
else
local info = 'First name : '..(msg.from.first_name or '')..'\nLast name: '..(msg.from.last_name or '')..'\nNumber: +'..(msg.from.phone or 'شماره تلفن موجود نیست')
reply_msg(msg.id, info, ok_cb, false)
end
end

return {
patterns = {
"^[!/#]number"
},
run =
