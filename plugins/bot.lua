local datebase = {
  "<b>ONLINE</b>",
  "<i>ONLINE</i>",
  "<code>ONLINE</code>",
  }
local function run(msg, matches)
return datebase[math.random(#datebase)]
end
return {
  patterns = {
    "^[!#/]([Bb][Oo][Tt])",
  },
  run = run
}
