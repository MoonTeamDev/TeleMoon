local datebase = {
  "What the hell are you doing😐",
  "<b>I'm here mother fucker  
        /🖕
 (°·°)/
 / | /
/  | 
 \ |8=====D
  / \
 /   \</b>",
  "Im here😒",
  }
local function run(msg, matches)
return datebase[math.random(#datebase)]
end
return {
  patterns = {
    "^[/!#][Pp][Ii][Nn][Gg]",
    "^[/!#][Bb][Oo][Tt]",
  },
  run = run
}
