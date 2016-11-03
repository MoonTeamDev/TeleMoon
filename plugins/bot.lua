local datebase = {
  "What the hell are you doing😐",
  "I'm here mother fucker  
        /🖕
 (°·°)/
 / | /
/  | 
 \ |8=====D
  / \
 /   \",
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
