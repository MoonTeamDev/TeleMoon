function run(msg, matches)
  local text = matches[1]
  local url = "http://2wap.org/usf/text_sm_gen/sm_gen.php?text="..text.."
   local file = download_to_file(url,'iteam.jpg')
   send_photo2(get_receiver(msg), file, "By @MoonsTeam", rmtmp_cb, cb_extra)

        
end


return {
  description = "تبدیل متن به لوگو",
  usage = {
    "ساخت لوگو",
  },
  patterns = {
   "^[!#/]logo (.*)$"
  },
  run = run
}
--by @MoonsTeam , @Makan
