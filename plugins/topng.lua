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

return {
   
     patterns = {
   "^[/!#](png)$",
},
run = run,
}
