local function run(msg, matches)
 local makan = 90285047
   local hash = 'rank:variables'
   local text = ''
     local value = redis:hget(hash, msg.from.id)
      if not value then
         if msg.from.id == tonumber(makan) then 
            text = text..'Bye Bye dady (^_^)\n\n'
          elseif is_admin2(msg.from.id) then
            text = text..'Bye admin 😜\n\n'
           elseif is_owner2(msg.from.id, msg.to.id) then
            text = text..'Bye Group Owner😝 \n\n'
          elseif is_momod2(msg.from.id, msg.to.id) then
            text = text..'Bye Group Moderator😛 \n\n'
      else
            text = text..'Bye Member😐\n\n'
       end
       else
        text = text..'Bye '..value..'  \n\n'
      end
 return text
     
 end
 
 return {
   patterns = {
 
 
 "^[Bb]ye$",
 "^بای$",
 "^[Bb]y$",
 "^[Bb]b$",
 "^خداحافظ$",
 "^خدافظ$",
   }, 
   run = run 
 }
