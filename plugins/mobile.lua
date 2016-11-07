local pass = 'dram1135'
local function run(msg, matches)
  local url = 'http://api.avirateam.ir/mobile/cli/index.php?pass='..pass
  local req = http.request(url)
  return req..' @MoonsTeam'
end

return {
  description = "Get New Mobile Phones From Mobile.ir",
  patterns = {
    "^[!/#]([Mm][Oo][Bb][Ii][Ll][Ee])$"
  },
  run = run
}
