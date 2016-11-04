-- by @MoonsTeam
local text1 = { 
"√", 
"#", 
"=>", 
"<>", 
">>", 
} 
local text2 = { 
"√", 
"#", 
"=>", 
"<>", 
">>", 
} 
local function mrnitro(msg, matches) 
local url , res = http.request('http://api.gpmod.ir/time/') 
if res ~= 200 then return "!Error!" end 
local jdat = json:decode(url) 
local fatime = jdat.FAtime 
local entime = jdat.ENtime 
local fadate = jdat.FAdate 
local endate = jdat.ENdate 
local r1 = text1[math.random(#text1)] 
local r2 = text2[math.random(#text2)] 
local text = r1.."<b>FAtime:</b> "..fatime.."\n"..r2.."<b>ENtime:</b> "..entime.."\n"..r1.."<b>FAdate:</b> "..fadate.."\n"..r2.."<b>ENdate:</b> "..endate 
return text 
end 
return { 
  patterns = { 
     "^[/!#]([Dd][Aa][Tt][Ee])$", 
  }, 
  run = run
} 
