function run(msg, matches)
if matches[1] == 'profile' then
  local moonsteam = matches[2]
  local moonsteam2 = matches[3]
  local moonsteam3 = matches[4]
  local url = "http://api.roonx.com/photo/shakh/pic.php?text="..moonsteam.."&color="..moonsteam2.."&size="..moonsteam3
  local ext = "emoji.webp"
  local cb_extra = {file_path=file}
  local receiver = get_receiver(msg)
  local file = download_to_file(url, "emoji.webp")
  send_document(receiver, file, rmtmp_cb, cb_extra)
end
   end
return {
  patterns = {
   "[!#/](profile) (.*) (.*) (.*)",
  },
  run = run
}
