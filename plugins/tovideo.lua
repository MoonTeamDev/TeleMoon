 local function tovideo(msg, success, result) 
  local receiver = get_receiver(msg) 
  if success then 
    local file = './data/tovideo/'..msg.from.id..'.gif' 
    print('File downloaded to:', result) 
    os.rename(result, file) 
    print('File moved to:', file) 
    send_video(get_receiver(msg), file, ok_cb, false) 
    redis:del("gif:video") 
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
       if msg.to.type == 'document' and redis:get("gif:video") then 
        if redis:set("gif:video", "waiting") then 
        end 
       end 
      if matches[1]:lower() == "video"  then 
     redis:get("gif:video") 
    send_large_msg(receiver, '', ok_cb, false) 
        load_document(msg.reply_id, tovideo, msg) 
    end 
end 
end 
return { 
patterns = { 
   "^[#!/](video)$", 
   "%[(document)%]", 
   "%[(video)%]", 
 }, 
run = run, 
} 

-- by @MoonsTeam , @Makan
