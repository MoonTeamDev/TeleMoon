function run(msg, matches) 
      local url = "http://2wap.org/usf/text_sm_gen/sm_gen.php?text="..msg.from.id
       local  file = download_to_file(url,'emoji.webp') 
         send_document(get_receiver(msg), file, ok_cb, false) 

end 

return { 
  description = "دریافت ایدی به صورت استیکر", 
  usage = { 
    "پلاگین فان!", 
  }, 
  patterns = { 
   "^myid$", 
  }, 
  run = run 
} 
