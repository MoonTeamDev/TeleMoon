local function run(msg, matches)
    if msg.text == "ping" then
      if is_sudo(msg) then
        return "<i>Pong!</i>"
      else
        return "<b>I'm here mother fucker  
        /🖕
 (°·°)/
 / | /
/  | 
 \ |8=====D
  / \
 /   \</b>"
      end
    elseif msg.text == "bot" then
      if is_sudo(msg) then
        return "What?😗"
      else
        return "<i>Eat it mother fucker  
        /🖕
 (°·°)/
 / | /
/  | 
 \ |8=====D
  / \
 /   \</i>"
      end
    elseif msg.text == "tik" then
      if is_sudo(msg) then
        return "<code>tak</code>"
      else
        return "<code>come here bitch  
        /🖕
 (°·°)/
 / | /
/  | 
 \ |8=====D
  / \
 /   \</code>"
        end
return {
	patterns = {
"^[!#/]ping$",
"^[!#/]bot$",
"^[!#/]tik$",
},
run = run,
}
