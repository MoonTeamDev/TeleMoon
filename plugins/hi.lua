function run(msg, matches)
        local hash = 'rank:variables'
   local text = ''
     local value = redis:hget(hash, msg.from.id)
      if not value then
   text = text..'سلام  '..msg.from.print_name' \n\n'
  end
 else 
  text = text..'سلام '..value..'  \n\n'
 return text
end

return {
  description = "Help owner.  ", 
  usage = {
    "ownerhelp: Show help for owners.",
  },
  patterns = {
    "^([Ss]lm)$",
  "^(سلام)$",
  }, 
  run = run,
}
