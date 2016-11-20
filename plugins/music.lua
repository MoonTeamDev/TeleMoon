function sectominn (Sec)
if (tonumber(Sec) == nil) or (tonumber(Sec) == 0) then
return "00:00"
else
Seconds = math.floor(tonumber(Sec))
if Seconds < 1 then Seconds = 1 end
Minutes = math.floor(Seconds / 60)
Seconds = math.floor(Seconds - (Minutes * 60))
if Seconds < 10 then
Seconds = "0"..Seconds
end
if Minutes < 10 then
Minutes = "0"..Minutes
end
return Minutes..':'..Seconds
end
end

function run(msg, matches)
  if matches[1]:lower() == "dl" then
    local value = redis:hget('music:'..msg.to.id, matches[2])

    if not value then
      return 'I cannot find your request'
    else

    local link = redis:hget('music2:'..msg.to.id,matches[2])
    local title = redis:hget('music3:'..msg.to.id,matches[2])
    send_msg(get_receiver(msg),value..'\n'..link,ok_cb,false)
    --local file = download_to_file(link,title..'.mp3')
   --send_audio(get_receiver(msg), file, ok_cb, false)
    return 
    end
    return
  end
  
  local url = http.request("http://api.gpmod.ir/music.search/?v=2&q="..URL.escape(matches[2]).."&count=30")
  local jdat = json:decode(url)
  local textt , time , num = ''
  local hash = 'music:'..msg.to.id
  local hash2 = 'music2:'..msg.to.id
  local hash3 = 'music3:'..msg.to.id
	
  redis:del(hash)
  if #jdat.response < 1 then return "I cannot find your request" end
    for i = 1, #jdat.response do
		local gs2 = http.request('http://gs2.ir/api.php?url='..jdat.response[i].link..'')
	
      timee = sectominn(jdat.response[i].duration / 1000)
      textt = textt..i..'- 🎧 '..jdat.response[i].title..'\n 🕒'..timee..'\n\n'
      redis:hset(hash, i,'Title: '..jdat.response[i].title..'\n 🕒 '..timee)
      redis:hset(hash2, i,gs2)
      redis:hset(hash3, i,jdat.response[i].title)

    end
    textt = textt..'For get download link send:\n/dl <number>\n(example): /dl 1'
  return textt
end

return {

patterns = {
  "^[/!#]([Mm][Uu][Ss][Ii][Cc]) (.*)$",
  "^[/!#]([dD][Ll]) (.*)$"
  }, 
  run = run 
}

--by @MoonsTeam , @Makan
