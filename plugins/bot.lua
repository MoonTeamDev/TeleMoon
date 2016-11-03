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
    "^[/!#][Bb][Oo][Tt]",
  },
  run = run
}
