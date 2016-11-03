local datebase = {
  "Im here😒",
  "What the hell😡",
  "Online :/",
  }
local function run(msg, matches)
return datebase[math.random(#datebase)]
end
return {
  patterns = {
    "^[Pp][Ii][Nn][Gg]",
  },
  run = run
}
