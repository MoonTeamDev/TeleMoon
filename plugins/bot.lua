do

local function run(msg)
   if msg.text == "tik" then
  return "<b>tak</b>"
 end
return {
    patterns = {
    "^tik"
},
run = run,
}
