local function run(msg,matches) 
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
  local  file = download_to_file(url,'keep.webp') 
    send_document(get_receiver(msg), file, ok_cb, false) 
end 
end 
return { 
patterns = { 
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
run = run, 
} 

-- by @MoonsTeam , @Makan
