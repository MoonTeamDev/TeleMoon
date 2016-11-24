local function run(msg, matches)
local text = [[
<b>TeleMoon PoweFul AntiSpam</b>🚀

🔘<i>The best bot group manager</i>

🔹Sudo : @Makan
🔸Admin : @HellSudo
🔸Channel : @MoonsTeam
🔹Website : MoonTeam.ir

]]
return text 
end 
return {
  patterns = {
    "^[!/#][Bb]otinfo$",
  }, 
  run = run,
}
