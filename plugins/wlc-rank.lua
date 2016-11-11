local function run(msg, matches)
 local makan = 90285047 
  if msg.action.type == "chat_add_user_link" then
   local hash = 'rank:variables'
   local text = ''
     local value = redis:hget(hash, msg.from.id)
      if not value then
         if msg.from.id == tonumber(makan) then 
            text = text..'Welcome Dady (^_^) \n\n'
          elseif is_admin2(msg.from.id) then
            text = text..'Welcome Admin😝 \n\n'
          elseif is_owner2(msg.from.id, msg.to.id) then
            text = text..'Welcome Group Owner😜 \n\n'
          elseif is_momod2(msg.from.id, msg.to.id) then
            text = text..'Welcome Group Moderator😛 \n\n'
       else
            text = text..'Welcome😐 "..msg.from.first_name.."\n\n'
       end
       else
        text = text..'Hi '..value.. "\nwelcome to " ..string.gsub(msg.to.print_name, "_", " ").."\n\n"
      end
 return text
  end    
 end
 return {
   patterns = {
     "^!!tgservice (chat_add_user_link)$",
 
   }, 
   run = run 
}
