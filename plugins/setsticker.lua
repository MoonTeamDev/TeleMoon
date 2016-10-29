local function tosticker(msg, success, result)
  local receiver = get_receiver(msg)
  if success then
    local file = msg.from.id..'.webp'
    print('File downloaded to:', result)
    os.rename(result, file)
    print('File moved to:', file)
    send_document(get_receiver(msg), file, ok_cb, false)
	send_large_msg(receiver, 'Done!', ok_cb, false)
    redis:del("photo:setsticker")
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false)
  end
end
----------------------------------
local function run(msg,matches)
    local receiver = get_receiver(msg)
    local group = msg.to.id
    if msg.media then
       if msg.media.type == 'photo' and redis:get("photo:setsticker") then
        if redis:get("photo:setsticker") == 'waiting' then
          load_photo(msg.id, tosticker, msg)
        end
       end
    end
    if matches[1] == "setsticker" and is_owner(msg) then
     redis:set("photo:setsticker", "waiting")
     return 'Please send your photo now'
    end
-------------------------------
	if matches[1]:lower() == 'me' then --اینجا هردستوری که میخاید بهش جواب بده رو بزارید مثال infoیا همون me یا mysticker فقط یادتون نره تو پترن ها هم بزارید
	send_document(get_receiver(msg), msg.from.id..".webp", ok_cb, false)
end
end
--------------------------------
return {
  patterns = {
 "^[!#/](setsticker)$",
 "^([Mm][Ee])$",
 "^[!#/]([Mm]e)$",
 "%[(photo)%]",
  },
  run = run,
}
