local color = {
"red",
"black",
"blue",
"green",
"yellow",
"magenta",
"Orange",
"DarkOrange",
"Purple",
"Golden",
}
local font = {
"mathrm",
"mathbf",
"mathit",
"mathfrak",
"mathrm",
}
local size = {
"300",
"500",
"700",
"800",
}
local function run(msg, matches)
local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then return "No connection" end
local jdat = json:decode(url)
local c = color[math.random(#color)]
local s = size[math.random(#size)]
local f = font[math.random(#font)]
local url = "http://latex.codecogs.com/png.latex?".."\\dpi{"..s.."}%20\\huge%20\\"..f.."{{\\color{"..c.."}"..jdat.ENtime.."}}"
local file = download_to_file(url,'time.webp')
send_document(get_receiver(msg) , file, ok_cb, false)
end
 
return {
  patterns = {
    "^[Tt]ime$",
    "^[!/#][Tt]ime$",
  }, 
  run = run 
}
