local function run(msg,matches)
    if is_sudo(msg) then
    local text = URL.escape(matches[2])
    local channel_id = matches[1]  
      if res == 400 then
         reply_msg(msg.id, 'Error !', ok_cb, true)    
         else
         reply_msg(msg.id, 'Sent !', ok_cb, true)    
      end
      end
  end
  return {
      patterns = {
          "^[!/#]send (.*)+(.*)$"
          },
      run = run
  }
