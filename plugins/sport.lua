local function run(msg, matches)
	if matches[1]:lower() == 'sport' then
    local url = 'http://www.top90.ir/iran/persian-gulf-league'
  local res,code = http.request(url)
local text = '🔆فوتبال لیگ برتر ایران🔆\n\n'
local text2 = '⭕️اطلاعات بیشتر در مورد تیم شما :\n\n'
local i = 1
for teams in res:gmatch('<td class="ltid">[^<]*</td><td class="ltn">[^<]*</td><td class="ltg">[^<]*</td><td class="ltw">[^<]*</td><td class="ltd">[^<]*</td><td class="ltl">[^<]*</td><td class="ltgf">[^<]*</td><td class="ltga">[^<]*</td><td class="ltgd" dir="ltr">[^<]*</td><td class="ltp">[^<]*</td>') do
local tinfo = {teams:match('<td class="ltid">([^<]*)</td>')}
local tinfo2 = {teams:match('<td class="ltn">([^<]*)</td>')}
local tinfo3 = {teams:match('<td class="ltg">([^<]*)</td>')}
local tinfo4 = {teams:match('<td class="ltp">([^<]*)</td>')}
local tinfo5 = {teams:match('<td class="ltw">([^<]*)</td>')}
local tinfo6 = {teams:match('<td class="ltd">([^<]*)</td>')}
local tinfo7 = {teams:match('<td class="ltl">([^<]*)</td>')}
local tinfo8 = {teams:match('<td class="ltgf">([^<]*)</td>')}
local tinfo9 = {teams:match('<td class="ltga">([^<]*)</td>')}
local tinfo10 = {teams:match('<td class="ltgd">([^<]*)</td>')}
for p=1 , 1 do
text = text..''..tinfo[p]..'⭕️ تیم : '..tinfo2[p]..'\n💢 امتیاز : '..tinfo4[p]:gsub('&ndash;','-')..'\n➖➖➖➖➖\n'
end
i = i + 1
end
return text..'\n\n⁉️توجه : \nبرای دریافت اطلاعات بیشتر هر تیم از عبارت زیر استفاده کنید\n/tinfo عدد جایگاه تیم\nمثال : \n/tinfo 5'
	end
	
	
if matches[1] == 'tinfo' then
    local url1 = 'http://www.top90.ir/iran/persian-gulf-league'
  local res1,code1 = http.request(url1)
local text2 = '⭕️اطلاعات بیشتر در مورد تیم شما :\n\n'
local o = 1
local r = 1
local r1 = 1
local r2 = 1
local r3 = 1
local r8 = 1
local r4 = 1
local r5 = 1
local r6 = 1
local r7 = 1
for teams3 in res1:gmatch('<td class="ltid">([^>]*)</td><td class="ltn">([^>]*)</td><td class="ltg">([^>]*)</td><td class="ltw">([^>]*)</td><td class="ltd">([^>]*)</td><td class="ltl">([^>]*)</td><td class="ltgf">([^>]*)</td><td class="ltga">([^>]*)</td><td class="ltgd" dir="ltr">([^>]*)</td><td class="ltp">([^>]*)</td>') do
if o == tonumber(matches[2]) then
text6 = 'جایگاه : '..teams3..' \n\n'
end
o = o + 1
end
for teams4 in res1:gmatch('<td class="ltn">([^>]*)</td><td class="ltg">([^>]*)</td><td class="ltw">([^>]*)</td><td class="ltd">([^>]*)</td><td class="ltl">([^>]*)</td><td class="ltgf">([^>]*)</td><td class="ltga">([^>]*)</td><td class="ltgd" dir="ltr">([^>]*)</td><td class="ltp">([^>]*)</td>') do
if r == tonumber(matches[2]) then
text7 = text6..'💢 نام تیم : '..teams4..'\n\n'
end
r = r + 1
end
for teams5 in res1:gmatch('<td class="ltg">([^>]*)</td><td class="ltw">([^>]*)</td><td class="ltd">([^>]*)</td><td class="ltl">([^>]*)</td><td class="ltgf">([^>]*)</td><td class="ltga">([^>]*)</td><td class="ltgd" dir="ltr">([^>]*)</td><td class="ltp">([^>]*)</td>') do
if r1 == tonumber(matches[2]) then
text7 = text7..'🔢 تعداد بازی : '..teams5..'\n\n'
end
r1 = r1 + 1
end
for teams6 in res1:gmatch('<td class="ltw">([^>]*)</td><td class="ltd">([^>]*)</td><td class="ltl">([^>]*)</td><td class="ltgf">([^>]*)</td><td class="ltga">([^>]*)</td><td class="ltgd" dir="ltr">([^>]*)</td><td class="ltp">([^>]*)</td>') do
if r2 == tonumber(matches[2]) then
text7 = text7..'🎯بازی های برنده شده : '..teams6..'\n\n'
end
r2 = r2 + 1
end
for teams7 in res1:gmatch('<td class="ltd">([^>]*)</td><td class="ltl">([^>]*)</td><td class="ltgf">([^>]*)</td><td class="ltga">([^>]*)</td><td class="ltgd" dir="ltr">([^>]*)</td><td class="ltp">([^>]*)</td>') do
if r3 == tonumber(matches[2]) then
text7 = text7..'🖱 بازی های مساوی شده : '..teams7..'\n\n'
end
r3 = r3 + 1
end
for teams8 in res1:gmatch('<td class="ltl">([^>]*)</td><td class="ltgf">([^>]*)</td><td class="ltga">([^>]*)</td><td class="ltgd" dir="ltr">([^>]*)</td><td class="ltp">([^>]*)</td>') do
if r4 == tonumber(matches[2]) then
text7 = text7..'💀 بازی های باخته : '..teams8..'\n\n'
end
r4 = r4 + 1
end
for teams9 in res1:gmatch('<td class="ltgf">([^>]*)</td><td class="ltga">([^>]*)</td><td class="ltgd" dir="ltr">([^>]*)</td><td class="ltp">([^>]*)</td>') do
if r5 == tonumber(matches[2]) then
text7 = text7..'⚽️ گل زده : '..teams9..'\n\n'
end
r5 = r5 + 1
end
for teams10 in res1:gmatch('<td class="ltga">([^>]*)</td><td class="ltgd" dir="ltr">([^>]*)</td><td class="ltp">([^>]*)</td>') do
if r6 == tonumber(matches[2]) then
text7 = text7..'🗑 گل خورده : '..teams10..'\n\n'
end
r6 = r6 + 1
end
for teams11 in res1:gmatch('<td class="ltgd" dir="ltr">([^>]*)</td><td class="ltp">([^>]*)</td>') do
if r7 == tonumber(matches[2]) then
text7 = text7..'🏷 تفاضل گل : '..teams11..'\n\n'
end
r7 = r7 + 1
end
for teams12 in res1:gmatch('<td class="ltp">([^>]*)</td>') do
if r8 == tonumber(matches[2]) then
text7 = text7..'🏆امتیاز : '..teams12..'\n\n'
end
r8 = r8 + 1
end
local rrreee = text7:gsub('&ndash;','-')
		return rrreee
		end
end
return {
   patterns = {
"^[/#!](sport)$",
"^[/#!](tinfo) (%d+)$",
   },
   run = run
}

--by @MoonsTeam
