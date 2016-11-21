function run(msg, matches)
if matches[1] == 'hacker' then
  local text = matches[2]
  local url = "http://www.keepcalmstudio.com/-/p.php?t=%EE%BB%B0%0D%0AIM%20"..text.."%0D%0AME%0D%0A%3E%3EBIG%0D%0AHECKER%0D%0ACYBER&bc=0D0201&tc=ffffff&cc=ffffff&uc=true&ts=true&ff=PNG&w=500&ps=sq
  local ext = "hacker.webp"
  local cb_extra = {file_path=file}
  local receiver = get_receiver(msg)
  local file = download_to_file(url, "hacker.webp")
  send_document(receiver, file, rmtmp_cb, cb_extra)
end
   end
return {
  patterns = {
   "[!#/](hacker) (.*)",
  },
  run = run
}
