do
function run(msg, matches) 
 
      
      if matches[1] == 'date' and is_sudo(msg) then
local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then
 return "No connection"
  end
  local colors = {'blue','green','yellow','magenta','Orange','DarkOrange','red'}
  local fonts = {'mathbf','mathit','mathfrak','mathrm'}
local jdat = json:decode(url)
local url = 'http://latex.codecogs.com/png.download?'..'\\dpi{600}%20\\huge%20\\'..fonts[math.random(#fonts)]..'{{\\color{'..colors[math.random(#colors)]..'}'..jdat.ENdate..'}}'
local file = download_to_file(url,'time.webp')
send_document(get_receiver(msg) , file, ok_cb, false)

end
end

return { 
  description = "date", 
  usage = { 
    "Date", 
  }, 
  patterns = { 
   "^[Dd]ate$", 
   "^[!#/][Dd]ate$",  
  }, 
  run = run 
}
