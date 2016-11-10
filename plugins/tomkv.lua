local function tomkv(msg, success, result) 
  local receiver = get_receiver(msg) 
  if success then 
    local file = './data/tomkv/'..msg.from.id..'.mkv' 
    print('File downloaded to:', result) 
    os.rename(result, file) 
    print('File moved to:', file) 
    send_document(get_receiver(msg), file, ok_cb, false) 
    redis:del("video:document") 
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
       if msg.to.type == 'video' and redis:get("video:document") then 
        if redis:set("video:document", "waiting") then 
        end 
       end 
      if matches[1]:lower() == "mkv"  then 
     redis:get("video:document") 
    send_large_msg(receiver, '', ok_cb, false) 
        load_video(msg.reply_id, tomkv, msg) 
    end 
end 
end 
return { 
patterns = { 
   "^[#!/](mkv)$", 
   "%[(document)%]",  
   "%[(video)%]", 
 }, 
run = run, 
} 

-- by @MoonTeam , @Makan
