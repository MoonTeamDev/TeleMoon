local function run(msg, matches)
local text = io.popen("sh ./data/cmd.sh"):read('*all')
if is_sudo(msg) then
  return text
end
  end
return {
  patterns = {
    '^[/!#][Ss][Ee][Rr][Vv][Ee][Rr][Ii][Nn][Ff][Oo]$'
  },
  run = run,
  moderated = true
}
