local function toimage(msg, success, result) 
  local receiver = get_receiver(msg) 
  if success then 
    local file = './data/tophoto/'..msg.from.id..'.jpg' 
    print('File downloaded to:', result) 
    os.rename(result, file) 
    print('File moved to:', file) 
    send_photo(get_receiver(msg), file, ok_cb, false) 
    redis:del("sticker:photo") 
  else 
    print('Error downloading: '..msg.id) 
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false) 
  end 
end 

return {
   
     patterns = {
   "^[/!#](photo)$",
},
run = run,
}
