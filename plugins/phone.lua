function run(msg, matches) 
      local url = "http://2wap.org/usf/text_sm_gen/sm_gen.php?text="..msg.from.number
       local  file = download_to_file(url,'emoji.webp') 
         send_document(get_receiver(msg), file, ok_cb, false) 

end 

return { 
  description = "sticker number", 
  usage = { 
    "Fun", 
  }, 
  patterns = { 
   "^[!#/]mynumber$", 
  }, 
  run = run 
} 

-- by @MoonsTeam , @Makan
