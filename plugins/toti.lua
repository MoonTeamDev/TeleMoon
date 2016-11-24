local function run(msg, matches)
local receiver = get_receiver(msg)
local hash = 'toti:'..receiver
     if matches[1] == 'toti' and is_sudo(msg) then
--Enable toti
     if matches[2] == 'on' then
    redis:del(hash)
   return 'toti has been enabled'
--Disable toti
     elseif matches[2] == 'off' then
    redis:set(hash, true)
   return 'toti has been disabled'
   --toti Status
    elseif matches[2] == 'status' then
      if not redis:get(hash) then
   return 'toti is enable'
       else
   return 'toti is disable'
         end
      end
   end
  local text = matches[1]
  local b = 1

  if not redis:get(hash) then
  
  while b ~= 0 do
    text = text:trim()
    text,b = text:gsub('^!+','')
  end
  return reply_msg(msg.id, text, ok_cb, false)
end
end
return {
  description = "",
  usage = "",
  patterns = {
  "^[!/#](toti) (.*)$",
    "^(.+)$"
  }, 
  run = run 
}
--by @MoonsTeam
