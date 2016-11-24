 function run(msg, matches) 
      local text1 = matches[1] 
     local text2 = matches[2]
    local text3 = matches[3]
   local text4 = matches[4]
  local text5 = matches[5]
      local url = "http://api.roonx.com/photo/keepcalm.php?text="..text1.."&color="..text2.."&fontbg="..text3.."&fontsize="..text4.."&fontsize2="..text5..
       local  file = download_to_file(url,'emoji.webp') 
         send_document(get_receiver(msg), file, ok_cb, false) 

end 

return { 
  description = "تبدیل متن به لوگو", 
  usage = { 
    "/keep text: ساخت لوگو", 
  }, 
  patterns = { 
   "^[/!#][Kk]eep (.+) (.+) (.+) (.+) (.+)$", 
  }, 
  run = run 
} 

--by @MoonsTeam , @Makan
