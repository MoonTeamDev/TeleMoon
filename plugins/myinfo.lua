do
function run(msg, matches)
local reply_id = msg['id']
local text = 'myinfo'
local text1 =""..(msg.from.print_name or '')\n"..(msg.from.username or '')\n"..(msg.from.id or '')
  reply_msg(reply_id, text1, ok_cb, false)
end
return {
  description = "",
  usage = "",
  patterns = {
    "^[!/#]myinfo$",
  },
  run = run
}
end
