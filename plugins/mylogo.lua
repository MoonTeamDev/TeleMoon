function run(msg, matches) 
     local url = "http://api.iteam-co.ir/imgmaker.php?text="..msg.from.print_name.."&size=150"
       local  file = download_to_file(url,'emoji.webp') 
         send_document(get_receiver(msg), file, ok_cb, false)

end 

return { 
  description = "sticker logo", 
  usage = { 
    "Fun", 
  }, 
  patterns = { 
   "^[!#/]mylogo$", 
  }, 
  run = run 
} 

-- by @MoonsTeam , @Makan
