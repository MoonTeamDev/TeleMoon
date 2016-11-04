local function run(msg, matches) 
if matches[1] == 'pic' then
local uptext = URL.escape(matches[3])
local downtext = ''
if matches[4] then
downtext = URL.escape(matches[4])
end
local url = 'http://weblogg.ir/BeatBot/picgraphy/?FasTReaCtoR='..uptext..'&text='..downtext..'&theme='..URL.escape(matches[2])
local file = download_to_file(url,'pic.png')
    send_photo(get_receiver(msg), file, ok_cb, false)
end
if matches[1] == 'keepcalm' then
local url = "http://weblogg.ir/BeatBot/keepcalm/?FasTReaCtoR=t=%EE%BB%AA%0D%0AKEEP%0D%0ACALM%0D%0A" 
if matches[2] then  
url = url..URL.escape(matches[2]) 
end 
if matches[3] then  
url = url.."%0D%0A"..URL.escape(matches[3])
end 
if matches[4] then 
url = url.."%0D%0A"..URL.escape(matches[4])
end 
if msg.text then 
if msg.text:match('red') then 
url = url.."&bc=E31F17" 
end 
if msg.text:match('blue') then 
url = url.."&bc=0000ff" 
end 
if msg.text:match('yellow') then 
url = url.."&bc=ffff00" 
end 
if msg.text:match('green') then 
url = url.."&bc=00ff00" 
end 
if msg.text:match('black') then 
url = url.."&bc=000000" 
end 
if msg.text:match('pink') then 
url = url.."&bc=ff00ff" 
end
end
local url =  url.."&tc=FFFFFF&cc=FFFFFF&uc=true&ts=true&ff=PNG&w=500&ps=sq" 
  local  file = download_to_file(url,'keep.png')
    send_photo2(get_receiver(msg), file, ok_cb, false)
end

end 
return {
usage = {'<code>!keepcalm "[text1]" [color]</code>\n'
..'<code>!keepcalm "[text1]" "[text2]" [color]</code>\n'
..'<code>!keepcalm "[text1]" "[text2]" "[text3]" [color]</code>\n\n'
..'<code>!pic effect "[up text]"</code>\n'
..'<code>!pic effect "[up text]" "[down text]"</code>\n\n'
..'<b>colors list :</b>\n'
..'black - pink - red - green - yellow - blue\n'
..'<b>effects list :</b>\n'
..'toys - icecube - bob - oqtapus - patrick - cat - poker - shayan - troll - icecube - johnny - minion - nadam\n\n'
..'<b>examples :</b>\n\n'
..'<i>!keepcalm "and" "use" "beat bot" black</i>\n'
..'<i>!pic toys "beat bot" "its awsome"</i>\n'
},
  patterns = {
'^[#/!](pic) (.*) "(.*)" "(.*)"$',   
'^[#/!](pic) (.*) "(.*)"$',   
'^[#/!](keepcalm) "(.*)" "(.*)" "(.*)" black$',   
 '^[#/!](keepcalm) "(.*)" "(.*)" "(.*)" green$',
 '^[#/!](keepcalm) "(.*)" "(.*)" "(.*)" red$',  
 '^[#/!](keepcalm) "(.*)" "(.*)" "(.*)" blue$',  
 '^[#/!](keepcalm) "(.*)" "(.*)" "(.*)" pink$',  
 '^[#/!](keepcalm) "(.*)" "(.*)" "(.*)" yellow$',
'^[#/!](keepcalm) "(.*)" "(.*)" black$',  
 '^[#/!](keepcalm) "(.*)" "(.*)" red$',  
 '^[#/!](keepcalm) "(.*)" "(.*)" blue$',  
 '^[#/!](keepcalm) "(.*)" "(.*)" pink$',  
 '^[#/!](keepcalm) "(.*)" "(.*)" yellow$',
'^[#/!](keepcalm) "(.*)" green$',  
'^[#/!](keepcalm) "(.*)" black$',  
 '^[#/!](keepcalm) "(.*)" red$',  
 '^[#/!](keepcalm) "(.*)" blue$',  
 '^[#/!](keepcalm) "(.*)" pink$',
 '^[#/!](keepcalm) "(.*)" yellow$',
 '^[#/!](keepcalm) "(.*)" "(.*)" "(.*)"$',
 '^[#/!](keepcalm) "(.*)" "(.*)"$',
'^[#/!](keepcalm) "(.*)"$',  
  }, 
  run = run 
}
