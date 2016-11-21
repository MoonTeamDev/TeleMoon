local function short(url)
local yon = http.request('http://api.yon.ir/?url='..url)
local jdat = json:decode(yon)
return 'yon.ir/'..jdat.output
end

local function run(msg, matches)
  local url = http.request('http://ibacor.com/api/youtube-converter?u='..matches[1]..'&k=5d15fba95f7b88f9d1c0b4193c6f7183')
  local jdat = json:decode(url)
  local text = ''
text = text..'Video id : '..jdat.id..'\nTitle : '..jdat.title..'\nPhoto : '..jdat.img..'\nUrl : '..jdat.url..'\n\nLink :\n'
  for i = 1 , #jdat.data do
    text = text..'Quality : '..jdat.data[i].quality..'\nSize : '..(jdat.data[i].size or "")..'\nFormat : '..jdat.data[i].format..'\nDl link : '..short(jdat.data[i].link)..'\n\n'
end
  return text
  end
 
 
 
 
return {
  usage = "/youtube link ",
  patterns = {
    "^[/#!][Yy][Oo][Uu][Tt][Uu][Bb][Ee] (.*)$"
  },
  run = run
}
