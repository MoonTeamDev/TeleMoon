do

function run(msg, matches)
if msg.from.id == 90285047 then
  return "<i>I'm online</i> <a href="telegram.me/Namusn">Dadi 😍😘</a>"
elseif is_sudo(msg) then
 return "<i>I am online</i> <b>fuck you</b>😐"
elseif is_admin1(msg) then
 return "<b>fuck you</b>😐\n<i>I am online</i>͡° ͜ʖ ͡°\n<b>fuck you</b>😐"
elseif is_owner(msg) then
  return "<b>I'm online </b>😉"
elseif is_momod(msg) then
 return "<b>I'm online bitch :|️</b>"
else 
return "<b>I'm online 8=====D</b>"
end
end
return {
  description = "", 
  usage = "",
  patterns = {
    "^[!/#](bot)$",
  },
  run = run
}
end
