do
 function run(msg, matches)

  local fuse = '📌New req!\n\n👤Username: @' .. msg.from.username .. '\n\n👤Name: ' .. msg.from.print_name ..'\n\n👤Id: ' .. msg.from.id .. '\n\n📝TexT: \n' .. matches[1] 
 local fuses = '!printf user#id' .. msg.from.id
 
   local text = matches[1]
   local chat = "chat#id"..90285047 
   --like : local chat = "chat#id"..12345678
   
  local sends = send_msg(chat, fuse, ok_cb, false)
  return '✅req successfully sent'
 
 end
 end
 return {
  
  description = "req",
 
  usage = "!req",
  patterns = {
  "^[!#/][Rr]eq (.*)$"
 
  },
  run = run
 }
