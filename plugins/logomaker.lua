 function run(msg, matches) 
      local text1 = matches[1] 
     local text2 = matches[2] 
      local url = "http://api.roonx.com/photo/pic4.php?text="..text1.."&color="..text2
       local  file = download_to_file(url,'emoji.webp') 
         send_photo(get_receiver(msg), file, ok_cb, false) 

end 

return { 
  description = "تبدیل متن به لوگو", 
  usage = { 
    "/logo text: ساخت لوگو", 
  }, 
  patterns = { 
   "^[/!#][Ll]ogo (.+) (.+)$", 
  }, 
  run = run 
} 
