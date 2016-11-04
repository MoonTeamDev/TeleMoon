local function run(msg, matches)
local mtn = matches[2]
local link = matches[3]
if not is_momod(msg) then
return 'Only For Sudo'
end
if matches[1] == 'bold' then
  return '<b>'..mtn..'</b>'

elseif matches[1] == 'code' then
  return '<code>'..mtn..'</code>'

elseif matches[1] == 'hyper' then
  return '<a href="'..link..'">'..mtn..'</a>'
elseif matches[1] == 'italic' then
  return '<i>'..mtn..'</i>'
end
end
return {
  description = "تست", 
  usage = "تست",
  patterns = {
    "^[!#/]([Cc]ode) (.*)$",
    "^[!#/]([Ii]talic) (.*)$",
    "^[!#/]([Bb]old) (.*)$",
    "^[!#/]([Hh]yper) (.*) (.*)$"
  }, 
  run = run
}
