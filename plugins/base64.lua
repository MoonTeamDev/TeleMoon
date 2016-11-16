local function run(msg,matches)
local txt = matches[2]
  if matches[1] == 'code' and not txt:match('[Rr][Ee][Bb][Oo][Oo][Tt]') and not txt:match('[Rr][Mm') then
    local text = matches[2]
    local cmd = io.popen('echo '..text..' | base64')
    local result = cmd:read('*all')
    cmd:close()
    return 'result : \n\n'..result..'\n»@MoonsTeam«'
else
return 'This word is locked!'
  end
  if matches[1] == 'decode' and not txt:match('[Rr][Ee][Bb][Oo][Oo][Tt]') and not txt:match('[Rr][Mm') then
    local text = matches[2]
    local cmd = io.popen('echo '..text..' | base64 -d')
    local result = cmd:read('*all')
    cmd:close()
    return 'result : \n\n'..result..'\n»@MoonsTeam«'
else
return 'This word is locked!'
  end
end
return {
  patterns = {
    "^[!/#](code) (.*)$",
    "^[!/#](decode) (.*)$",
    },
  run = run
}
