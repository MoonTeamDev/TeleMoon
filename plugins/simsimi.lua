local namefa = "موون" --esm bot be farsi
local nameen = "[Mm][Oo][Oo][Nn]" --esm bot be englisi
local function get_response(text)
if text:match(nameen) then
  text = text:gsub(nameen.." ","")
end
if text:match(namefa) then
  text = text:gsub(namefa.." ","")
end
local lang = redis:get('simsimi:lang')
local myurl = "http://chatter.iteam-co.ir/"
if lang == "en" then
  myurl = myurl..'en.php?text='..URL.escape(text)
else
  myurl = myurl..'fa.php?text='..URL.escape(text)
end
local res = http.request(myurl)
local jdat = json:decode(res)
return jdat.response or nil
end
local function action_by_reply(extra, success, result)
if success then
  local bot = our_id
  local msg = extra.msg
  local matn = msg.text
  http.request("http://chatter.iteam-co.ir/fa-learn.php?text="..URL.escape(result.text).."&answer="..URL.escape(msg.text))
  if result.from.peer_id == tonumber(bot) then
    reply_msg(msg.id, get_response(matn), ok_cb, true)
  end
  end
end
function run(msg, matches)
local text = msg.text
 if text:match("[!/#][Ss]etlang (.*)") and is_sudo(msg) then
  local lang = text:match("[!/#][Ss]etlang (.*)")
    if lang == "fa" or "en" then
      redis:set('simsimi:lang',lang)
      return 'Lang Set To '..lang
	else
	  return "Only fa and en"
	end
  elseif text:match(nameen.." (.*)") then
  reply_msg(msg.id, get_response(text), ok_cb, true)
  elseif text:match(namefa.." (.*)") then
  reply_msg(msg.id, get_response(text), ok_cb, true)
  elseif msg.reply_id then
    get_message(msg.reply_id, action_by_reply, {msg=msg})
  end
  end
return {
   patterns = {
"(.*)"
},
   run = run
}

--by @MoonsTeam , @Makan
