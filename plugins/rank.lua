function run(msg, matches) 
      local url = "http://2wap.org/usf/text_sm_gen/sm_gen.php?text="..value
       local  file = download_to_file(url,'emoji.webp') 
         send_document(get_receiver(msg), file, ok_cb, false) 

end 

return { 
  description = "sticker id", 
  usage = { 
    "Fun", 
  }, 
  patterns = { 
   "^[!#/]rank$", 
  }, 
  run = run 
} 
