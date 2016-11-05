 function run(msg, matches) 
      local text1 = matches[1] 
     local text2 = matches[2] 
      local url = "http://2wap.org/usf/text_sm_gen/sm_gen.php?text="..text1
       local  file = download_to_file(url,'emoji.webp') 
         send_document(get_receiver(msg), file, ok_cb, false) 

end 

return { 
  description = "تبدیل متن به لوگو", 
  usage = { 
    "/emoji text text: ساخت لوگو", 
  }, 
  patterns = { 
   "^[/!#][Ee]moji (.+)$", 
  }, 
  run = run 
} 
