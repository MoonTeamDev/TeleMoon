 local function topng(msg, success, result) 
  local receiver = get_receiver(msg) 
  if success then 
    local file = './data/topng/'..msg.from.id..'.png' 
    print('File downloaded to:', result) 
    os.rename(result, file) 
    print('File moved to:', file) 
    send_document(get_receiver(msg), file, ok_cb, false) 
    redis:del("photo:png") 
  else 
    print('Error downloading: '..msg.id) 
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false) 
  end 
end  
------------------------ 
local function run(msg,matches)
  local receiver = get_receiver(msg) 
    local group = msg.to.id 
    if msg.reply_id then 
       if msg.to.type == 'photo' and redis:get("photo:sticker") then 
        if redis:set("photo:png", "waiting") then 
        end 
       end 
      if matches[1]:lower() == "png"  then 
     redis:get("photo:png") 
    send_large_msg(receiver, '', ok_cb, false) 
        load_photo(msg.reply_id, topng, msg) 
    end 
end  
end 
return { 
patterns = { 
"^[#!/](png)$", 
   "%[(document)%]", 
   "%[(photo)%]", 
 }, 
run = run, 
} 

-- by @MoonTeam , @Makan
