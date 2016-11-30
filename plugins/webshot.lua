function run(msg,matches)
local url = "http://irapi.ir/webshot?u="..matches[1]

local name = "cruel.jpeg"
local file = download_to_file(url,name) 
send_large_msg(get_receiver(msg),"Please wait...",ok_cb,false)
send_photo(get_receiver(msg),file,ok_cb,true) 
end
return {
patterns = {
"^[!/#]webshot (.*)$"
},
run = run
}
