function run(msg, matches)
if matches[1] == 'tike' then
  local text = matches[2]
  local url = "http://www.myfunstudio.com/-/p.php?d=pt&t="..text.."&c_bc=41992B&a=z&ag=&an=&aw=&cs=lovely&e=&f=c&n=&ts=1&ff=PNG&w=500&ps=sq
  local ext = "piece.webp"
  local cb_extra = {file_path=file}
  local receiver = get_receiver(msg)
  local file = download_to_file(url, "love.webp")
  send_document(receiver, file, rmtmp_cb, cb_extra)
end
   end
return {
  patterns = {
   "[!#/](piece) (.*)",
  },
  run = run
}
