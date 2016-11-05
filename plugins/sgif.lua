local run = function(msg,matches)
if matches[3] then

local texts = {}
for text in matches[3]:gmatch("[^\r\n]+") do
texts[#texts + 1] = URL.escape(text)
end
if #texts == 0 then
send_message(msg.to.peer_id, '❌ متن ها تشخیص داده نشد لطفا هر متن را در یک سطر وارد نمایید',ok_cb,false)
return
end
local sgif = download_to_file('http://magic-team.ir/wm.php?wtext='..URL.escape(matches[2])..'&texts='..json:encode(texts), 'sgif.gif')
send_document(msg.to.peer_id, sgif,ok_cb,false)

else
local texts = {}
for text in matches[2]:gmatch("[^\r\n]+") do
texts[#texts + 1] = URL.escape(text)
end
if #texts == 0 then
send_message(msg.to.peer_id, '❌ متن ها تشخیص داده نشد لطفا هر متن را در یک سطر وارد نمایید',ok_cb,false)
return
end
local sgif = download_to_file('http://magic-team.ir/wm.php?texts='..json:encode(texts), 'sgif.gif')
if msg.to.peer_type == 'user' then
send_document(msg.from.peer_id, sgif,ok_cb,false)
else
send_document(msg.to.peer_id, sgif,ok_cb,false)
end
end
end
return {
patterns = {
'^[/!#](sgif) (.+) %+ (.+)$',
'^[/!#](sgif) (.+)$'
},
run=run
}
