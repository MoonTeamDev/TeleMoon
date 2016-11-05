do
function run(msg, matches)
  return "Group id: "..msg.from.id.."\nGroup name: "..msg.to.title.."\nFirst name: "..(msg.from.first_name or '').."\nLast name: "..(msg.from.last_name or '').."\nYour id: "..msg.from.id.."\nYour username: @"..(msg.from.username or '').."\nPhone: +"..(msg.from.phone or '')
end
return {
  description = "", 
  usage = "",
  patterns = {
    "^[!/#]myinfo$",
    "^(اطلاعات)$"
  },
  run = run
}
end
