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

return {
   
     patterns = {
   "^[/!#](gif)$",
},
run = run,
}
