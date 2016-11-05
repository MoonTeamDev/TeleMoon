local datebase = {
  "<b>What</b>😐",
  "<i>Im here</i>😒",
  "<code>Im ok</code>",
  }
local function run(msg, matches)
return datebase[math.random(#datebase)]
end
return {
  patterns = {
    "^[!#/]([Bb][Oo][Tt])$",
  },
  run = run
}
