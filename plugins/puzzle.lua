function run(msg, matches)
if matches[1] == 'puzzle' then
  local text = matches[2]
  local url = "http://www.myfunstudio.com/-/p.php?t=%0AKeep%0D%0ACalm%0D%0A"..text.."%0D%0Ais%20King&bc=e31hg7&tc=tr467&cc=y566F&uc=true&ts=true&ff=PNG&w=500&ps=sq
  local ext = "puzzle.webp"
  local cb_extra = {file_path=file}
  local receiver = get_receiver(msg)
  local file = download_to_file(url, "love.webp")
  send_document(receiver, file, rmtmp_cb, cb_extra)
end
   end
return {
  patterns = {
   "[/!#](puzzle) (.*)",
  },
  run = run
}
