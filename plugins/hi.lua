local function run(msg, matches)
 local makan = 90285047
   local hash = 'rank:variables'
   local text = ''
     local value = redis:hget(hash, msg.from.id)
      if not value then
         if msg.from.id == tonumber(makan) then 
            text = text..'Hi dady (^_^)\n\n'
          elseif is_admin2(msg.from.id) then
            text = text..'Hi \n\n'
           elseif is_owner2(msg.from.id, msg.to.id) then
            text = text..'Hi \n\n'
          elseif is_momod2(msg.from.id, msg.to.peer_id) then
            text = text..'Hi \n\n'
      else
            text = text..'Hi\n\n'
       end
       else
        text = text..'Hi '..value..'  \n\n'
      end
 return text
     
 end
 
 return {
   patterns = {
 
 
 "^[Ss]lm$",
 "^سلام$",
 "^salam",
 
   }, 
   run = run 
 }
