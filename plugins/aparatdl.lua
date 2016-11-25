do

local function run(msg, matches)
  if matches[1] == 'aparatdl' then
 send_large_msg(receiver, 'wait!', ok_cb, false)
  local receiver = get_receiver(msg)
  local url = matches[2]

  local file = download_to_file(url)
  local cb_extra = {file_path=file}
  
    send_video(receiver, file, rmtmp_cb, cb_extra)
end  
end
return {
  description = "aparatdl", 
  usage = "!aparat link",
  patterns = {
    "^[#!/]aparatdl (.*)$"
  }, 
  run = run 
}

end
