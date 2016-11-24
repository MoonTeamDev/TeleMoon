local makan = 90285047
local function action_by_reply(extra, success, result)
  local hash = 'rank:variables'
  local text = ''
    local value = redis:hget(hash, result.from.id)
     if not value then
        if result.from.id == tonumber(makan) then
           text = text..'This is my Dady ^_^\n\n'
         elseif is_admin2(result.from.id) then
           text = text..'This is Global Admin :D\n\n'
         elseif is_owner2(result.from.id, result.to.id) then
           text = text..'This is Owner\n\n'
         elseif is_momod2(result.from.id, result.to.id) then
           text = text..'This is Moderator\n\n'
     else
           text = text..'This is Member\n\n'
      end
      else
       text = text..'This is '..value..' :|\n\n'
     end
   send_msg(extra.receiver, text, ok_cb,  true)
end

local function run(msg, matches)
local receiver = get_receiver(msg)
  local user = matches[1]
  local text = ''
if msg.reply_id then
        msgr = get_message(msg.reply_id, action_by_reply, {receiver=receiver})
      else
    return 
    end
    
end

return {
  patterns = {
    "in kie",
  "این کیه",
  "این کیه؟",
  }, 
  run = run 
}
