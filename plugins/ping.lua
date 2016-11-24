local datebase = {
  "<b>Pong!</b>",
  "<i>Pong!</i>",
  "<code>Pong!</code>",
  }
local function run(msg, matches)
return datebase[math.random(#datebase)]
end
return {
  patterns = {
    "^[!#/]([Pp][Ii][Nn][Gg])$",
  },
  run = run
}
