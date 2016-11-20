 function run(msg, matches) 
      local text1 = matches[1] 
     local text2 = matches[2]
    local text3 = matches[3]
      local url = "http://api.roonx.com/photo/pic2.php?text="..text1.."&color="..text2.."&bg="..text3
       local  file = download_to_file(url,'emoji.webp') 
         send_document(get_receiver(msg), file, ok_cb, false) 

end 

return { 
  description = "تبدیل متن به لوگو", 
  usage = { 
    "/logo text: ساخت لوگو", 
  }, 
  patterns = { 
   "^[/!#][Ll]ogo (.+) (.+) (.+)$", 
  }, 
  run = run 
} 
