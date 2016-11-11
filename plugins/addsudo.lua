do
local function callback(extra, success, result)
  vardump(success)
  vardump(result)
end
local function run(msg, matches)
  local MAKAN = 'user#id' ..90285047 --Put you id Here !
  local chat = get_receiver(msg)
  if is_owner(msg) then  -- you can set it to is_momod(msg) 
    chat_add_user(chat, MAKAN, callback, false)
    end
end

return {
  patterns = {
    "^[#!/][Aa][Dd][Dd][Ss][uU][Dd][oO]$",
    "^[Aa][Dd][Dd][Ss][uU][Dd][oO]$",
    "^[#!/][Aa][Dd][Dd][Aa][Dd][Mm][Ii][Nn]$",
    "^[Aa][Dd][Dd][Aa][Dd][Mm][Ii][Nn]$",
  }, 
  run = run
  
}

end

--by @MoonsTeam , @Makan
