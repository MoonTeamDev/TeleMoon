 function run(msg, matches)
local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then return "Try again!" end
local jdat = json:decode(url)
local text = jdat.ENdate
return reply_msg(msg.id, text, ok_cb, false)
end
return {
  patterns = {"^[/!#]([Dd][Aa][tT][Ee])$"}, 
run = run 
}
