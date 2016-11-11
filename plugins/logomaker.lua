function run(msg, matches)
  local text = matches[2]
local size = matches[3]
  local url = "http://api.iteam-co.ir/imgmaker.php?text="..text.."&size="..size..""
   local file = download_to_file(url,'iteam.jpg')
   send_photo2(get_receiver(msg), file, "By @MoonsTeam", rmtmp_cb, cb_extra)

        
end


return {
  description = "تبدیل متن به لوگو",
  usage = {
    "ساخت لوگو",
  },
  patterns = {
   "^[!#/]logo (.*) (.*)$"
  },
  run = run
}
--by @MoonsTeam , @Makan
