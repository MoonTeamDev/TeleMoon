local function run(msg,matches)
  if matches[1] == 'code' then
    local texts = matches[2]
	local text = texts:gsub('sudo','��')
    local cmd = io.popen('echo '..text..' | base64')
    local result = cmd:read('*all')
    cmd:close()
    local text = '<b>Result</b> :\n'..result
send_api_msg(msg, get_receiver_api(msg), text, true, 'html')
  else
    local text = matches[2]
    local cmd = io.popen('echo '..text..' | base64 -d')
    local result = cmd:read('*all')
    cmd:close()
    local text = '<b>Result</b> :\n'..result
send_api_msg(msg, get_receiver_api(msg), text, true, 'html')
  end
end
return {
usage = {'<code>!code [text]</code>\nbase64 encoding text\n<code>!decode [text]</code>\nbase64 decoding text'},
  patterns = {
    "^[!/#](code) (.*)",
    "^[!/#](decode) (.*)",
    },
  run = run
}
