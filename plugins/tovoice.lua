local function toaudio(msg, success, result) 
  local receiver = get_receiver(msg) 
  if success then 
    local file = './data/tovoice/'..msg.from.id..'.ogg' 
    print('File downloaded to:', result) 
    os.rename(result, file) 
    print('File moved to:', file) 
    send_audio(get_receiver(msg), file, ok_cb, false) 
    redis:del("video:audio") 
  else 
    print('Error downloading: '..msg.id) 
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false) 
  end 
end 
-----------------------  
local function run(msg,matches)
  local receiver = get_receiver(msg) 
    local group = msg.to.id 
    if msg.reply_id then 
       if msg.to.type == 'video' and redis:get("video:audio") then 
        if redis:set("video:audio", "waiting") then 
        end 
       end 
      if matches[1]:lower() == "voice"  then 
     redis:get("video:audio") 
    send_large_msg(receiver, '', ok_cb, false) 
        load_audio(msg.reply_id, toaudio, msg) 
    end 
end   
end 
return { 
patterns = { 
   "^[#!/](voice)$",
   "%[(audio)%]", 
 }, 
run = run, 
} 

-- by @MoonsTeam , @Makan
