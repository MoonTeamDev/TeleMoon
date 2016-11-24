local function run(msg, matches)
if matches[1] == "note" then
local hash = "note:"..msg.to.id
redis:set(hash,matches[2])
return "Your note : "..matches[2].."\nhas been set"
elseif matches[1] == "timenote" and matches[3] == msg.text then
local hash = "time:"..msg.to.id..":"..msg.from.id
local timer = tonumber(matches[2] * 60)
redis:setex(hash,timer,"time")
return "Your note : "..matches[3].."\nhas been set and will be remind in :"..matches[2]
end
if matches[1] == "mynote" then
local hash = "note:"..msg.to.id
return "Your last note is :\n"..redis:get(hash)
end
local hash = "time:"..msg.to.id..":"..msg.from.id
if redis:ttl(hash) == 0 then
return "User id\'s note remember : "..msg.from.id.."Username : @"..msg.from.username.."\nYour msg : "..redis:get(hash)
end
end

return {
patterns = {
   "[!#/]([Nn]ote) (.*)$",
      "[!#/]([Tt]imenote) (.*) (.*)$",
   "[!#/]([Mm]ynote)$",
   },
     run = run
	}
--by @MoonsTeam , @Makan
