local function run(msg, matches)
 local makan = 90285047
   local hash = 'rank:variables'
   local text = ''
     local value = redis:hget(hash, msg.from.id)
      if not value then
         if msg.from.id == tonumber(makan) then 
            text = text..'Hi dady (^_^)\n\n'
          elseif is_admin2(msg.from.id) then
            text = text..'Hi admin\n\n'
           elseif is_owner2(msg.from.id, msg.to.id) then
            text = text..'Hi owner\n\n'
          elseif is_momod2(msg.from.id, msg.to.id) then
            text = text..'Hi moderator\n\n'
        else
            text = text..'Hi '..value..'  \n\n'
        else
            text = text..'Hi chos user\n\n'
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
