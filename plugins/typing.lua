function run(msg, matches)
local hash = 'bot:typing'
if is_sudo(msg.from.peer_id) then
if matches[1] == "typing" and matches[2] == 'on' then
redis:set(hash, "on")
return "Typing > on"
elseif matches[1] == "typing" and matches[2] == 'off' then
redis:del(hash)
return "Typing > off"
end
end
if redis:get(hash) then
  send_typing(get_receiver(msg), ok_cb, false)
  end
end
return {
patterns = {
"^[#!/]([Tt]yping) (on)$",
"^[#!/]([Tt]yping) (off)$",
"(.*)"
},
run = run,
}
