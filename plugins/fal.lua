function run(msg, matches)
 local title , res = http.request('http://emrani.net/hafez/api/hafez/fal') if res ~= 200 then 
return "Error!" 
end 
local jdat = json:decode(title)local text = jdat.poem 
return text end 
return { 
patterns = {
"^[/!#]([Ff][Aa][Ll])$"
},
 run = run
 }
