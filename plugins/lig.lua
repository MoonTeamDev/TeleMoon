function run(msg, matches)
local url , res = http.request('http://botfamapi.zgig.in/bot132412412.php')
if res ~= 200 then return "No connection" end
local jdat = json:decode(url)
local text = jdat.Builder..' \n🇪🇸🇪🇸🇪🇸🇪🇸🇪🇸🇪🇸🇪🇸🇪🇸🇪🇸🇪🇸\n'..jdat.table..'\n'..jdat.team1..'😍امتیاز'..jdat.teams1..'\n'..jdat.team2..'😎امتیاز'..jdat.teams2..'\n'..jdat.team3..'😊امتیاز'..jdat.teams3..'\n'..jdat.team4..'😆امتیاز'..jdat.teams4..'\n'..jdat.team5..'😐امتیاز'..jdat.teams5..'\n'..jdat.team6..'🤔امتیاز'..jdat.teams6..'\n'..jdat.team7..'😕امتیاز'..jdat.teams7..'\n'..jdat.team8..'🙁امتیاز'..jdat.teams8..'\n'..jdat.team9..'☹️امتیاز'..jdat.teams9..'\n'..jdat.team10..'😯امتیاز'..jdat.teams10..'\n'..jdat.team11..'😦امتیاز'..jdat.teams11..'\n'..jdat.team12..'😧امتیاز'..jdat.teams12..'\n'..jdat.team13..'😢امتیاز'..jdat.teams13..'\n'..jdat.team14..'😥امتیاز'..jdat.teams14..'\n'..jdat.team15..'😨امتیاز'..jdat.teams15..'\n'..jdat.team16..'😰امتیاز'..jdat.teams16..'\n'..jdat.team17..'😰امتیاز'..jdat.teams17..'\n'..jdat.team18..'😰امتیاز'..jdat.teams18..'\n'..jdat.team19..'😰امتیاز'..jdat.teams19..'\n'..jdat.team20..'😰امتیاز'..jdat.teams20..'\n'
  if string.match(text, 'laliga') then text = string.gsub(text, 'laliga', 'لیگ برتر اسپانیا لالیگا') end
  if string.match(text, '0') then text = string.gsub(text, '0', '۰') end
  if string.match(text, '1') then text = string.gsub(text, '1', '۱') end
  if string.match(text, '2') then text = string.gsub(text, '2', '۲') end
  if string.match(text, '3') then text = string.gsub(text, '3', '۳') end
  if string.match(text, '4') then text = string.gsub(text, '4', '۴') end
  if string.match(text, '5') then text = string.gsub(text, '5', '۵') end 
  if string.match(text, '6') then text = string.gsub(text, '6', '۶') end
  if string.match(text, '7') then text = string.gsub(text, '7', '۷') end
  if string.match(text, '8') then text = string.gsub(text, '8', '۸') end
  if string.match(text, '9') then text = string.gsub(text, '9', '۹') end
  if string.match(text, 'barselona') then text = string.gsub(text, 'barselona', 'بارسلونا ') end
  if string.match(text, 'realmadrid') then text = string.gsub(text, 'realmadrid', 'رئال مادرید ') end
  if string.match(text, 'atletikomadrid') then text = string.gsub(text, 'atletikomadrid', 'اتلتیکومادرید ') end
  if string.match(text, 'viareal') then text = string.gsub(text, 'viareal', 'ویارئال ') end
  if string.match(text, 'bilbao') then text = string.gsub(text, 'bilbao', 'بیلبائو ') end
  if string.match(text, 'seltavigo') then text = string.gsub(text, 'seltavigo', 'سلتاویگو ') end 
  if string.match(text, 'sevia') then text = string.gsub(text, 'sevia', 'سویا ') end
  if string.match(text, 'malaga') then text = string.gsub(text, 'malaga', 'مالاگا ') end
  if string.match(text, 'realsosi') then text = string.gsub(text, 'realsosi', 'رئال سوسیداد ') end
  if string.match(text, 'betis') then text = string.gsub(text, 'betis', 'بتیس ') end
  if string.match(text, 'valensia') then text = string.gsub(text, 'valensia', 'والنسیا ') end
  if string.match(text, 'laspalmas') then text = string.gsub(text, 'laspalmas', 'لاس پالماس ') end
  if string.match(text, 'ibar') then text = string.gsub(text, 'ibar', 'ایبار ') end
  if string.match(text, 'spaniol') then text = string.gsub(text, 'spaniol', 'اسپانیول ') end
  if string.match(text, 'diportiv') then text = string.gsub(text, 'diportiv', 'دیپورتیوولاکرونیا ') end
  if string.match(text, 'khikhon') then text = string.gsub(text, 'khikhon', 'خیخون ') end 
  if string.match(text, 'granada') then text = string.gsub(text, 'granada', 'گرانادا ') end
  if string.match(text, 'rayovayecano') then text = string.gsub(text, 'rayovayecano', 'رایو وایه کانو') end
  if string.match(text, 'khetafe') then text = string.gsub(text, 'khetafe', 'ختافه') end
  if string.match(text, 'levante') then text = string.gsub(text, 'levante', 'لوانته') end
  return text
end
return {
  patterns = {"^(لالیگا)$", 
 "^(لیگ اسپانیا)$", 
"^[/!#](laliga)$"}, 
run = run 
}
—by @MoonsTeam
