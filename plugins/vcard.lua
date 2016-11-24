do
local function run(msg, matches)
    local makan = 90285047
    
      if msg.text:find('card') then
          if msg.from.id == tonumber(makan) then
        local text = [[

🔖First Name: Makan
🔖Last name: Javadzadeh
🔖Age: 17
🔖 Username: @Makan
🔖Phone number: +937989**** 
⭐️Team name: MoonTeam
📊Level: 10
📝Rank: Sudo, DeveLopeR, Founder, Manager
        ]]
        return text
    else
          return "You're not in Moon Team"


   end
end
end
return {
  patterns = {
    "^[!#/][Cc][Aa][Rr][Dd]$",
    "^([Cc]ard)$",
    },
  run = run
}
end
--by @MoonsTeam , @Makan
