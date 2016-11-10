local function tovoice(msg, success, result) 
  local receiver = get_receiver(msg) 
  if success then 
    local file = './data/tovoice/'..msg.from.id..'.ogg' 
    print('File downloaded to:', result) 
    os.rename(result, file) 
    print('File moved to:', file) 
    send_audio(get_receiver(msg), file, ok_cb, false) 
    redis:del("video:voice") 
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
       if msg.to.type == 'video' and redis:get("video:voice") then 
        if redis:set("video:audio", "waiting") then 
        end 
       end 
      if matches[1]:lower() == "voice"  then 
     redis:get("video:voice") 
    send_large_msg(receiver, '', ok_cb, false) 
        load_voice(msg.reply_id, tovoice, msg) 
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

-- by @MoonsTeam

-- در صورت نیاز به هرکدام از پلاگین ها دو خط پشت پترن آنها را بردارید
