do
local function getcolor(clr)
local color = clr
        if clr == 'red' then
            color = 'ff0000'
        elseif clr == 'black' then
            color = '000000'
      elseif clr == 'blue' then
          color = '0000ff'
    elseif clr == 'green' then
        color = '00c000'
    elseif clr == 'yellow' then
        color = 'ffff00'
    elseif clr == 'pink' then
        color = 'ff33cc'
    elseif clr == 'orange' then
        color = 'ff6600'
    elseif clr == 'brown' then
        color = '663300'
end
return color
end
local function getsize(size)
print('jsize'..size)
local ssize = '90'
if size == '1' then
ssize = '100'
elseif size == '2' then
ssize = '110'
elseif size == '3' then
ssize = '120'
elseif size == '4' then
ssize = '130'
elseif size == '5' then
ssize = '140'
else
ssize = '90'
end
return ssize
end
local function getbg(bg)
local bbg = 'a112-black.jpg?'
if bg == 'blue' then
bbg = '467c-blue.jpg?'
elseif bg == 'red' then
bbg = '467c-red.jpg?'
elseif bg == 'green' then
bbg = '467c-green.jpg?'
elseif bg == 'white' then
bbg = '400f-white.jpg?'
end
return bbg
end
local function pedit(str)
local color = '00c000'
local bg = 'a112-black.jpg?'
local bold = false
local italic = false
local size = '90'
if str:match('!#%w+> ') then
local cclr = str:match('!#(%w+)> ')
color = getcolor(cclr)
str = str:gsub('!#%w+> ','')
end
if string.match(str,'!%d> ') then
local csize = string.match(str,'!(%d)> ')
size = getsize(csize)
str = str:gsub('!%d> ','')
end
if str:match(',%w+ ') then
local cclr = str:match(',(%w+) ')
bg = getbg(cclr)
str = str:gsub(',%w+ ','')
end
if str:match('<b>.+</b>') then
bold = true
str = str:gsub('<b>','')
str = str:gsub('</b>','')
end
if str:match('<i>.+</i>') then
italic = true
str = str:gsub('<i>','')
str = str:gsub('</i>','')
end
return color,size,bg,bold,italic,str
end
local function run(msg, matches) 
if matches[1]:lower() == 't2i' then
local subdomain = 'copierteam'
local color,size,bg,bold,italic,txt = pedit(matches[2])
if not txt or text =='' then
return 'plz enter a valid text'
end
 local url ='https://'..subdomain..'.imgix.net/'..bg..'fm=png&txtsize='..size..'&txt='..URL.escape(txt)..'&txtpad=30&txtclr='..color..'&txtalign=middle,center&txtfont=sans-serif'
  if bold then
url = url..',bold'
end
  if italic then
url = url..',italic'
end
  local randoms = math.random(1000,900000)
  local randomd = randoms..".png"
  local file = download_to_file(url,randomd)
  local cb_extra = {file_path=file}
    send_photo(get_receiver(msg), file, rmtmp_cb, cb_extra)
end 
end 
return {
  description = "این پلاگین جهت تبدیل متن به عکس به صورت پیشرفته است. فرمول نویسی در این پلاگین به روش زیر است",
  usage = {
    "t2i فرمول : \n"
  .."فرمول نویسی در این پلاگین به روش زیر استبرای تعیین رنگ متن یا کلمه از این دستور استفاده کنید\n"
  .."!#----->\nبه جای —--- کد رنگ یا نام رنگ را وارد کنید، مثال:\n:!#blue> | !#cc0030>\n"
  .."برای سایز متن یا کلمه از 5 حالت میتوانید استفاده کنید:!1> !2> !3> !4> !5>\n" 
  .."برای کلفت نویسی متن را بین تگ B قرار دهید:\n<b>TEXT</b>\n"
  .."برای کج نویسی از تگ i استفاده کنید: \n<i>TEXT</i>\n"
  .."همچنین میتوانید با این دستور رنگ زمینه نیز تعریف کنید:\n ,<color>\nبجای color رنگ مورد نظر را قرار دهید\nرنگ های موجود:\n blue , red , green , white"
  },
  patterns = {
"^([Tt]2i) (.*)$",
"^([Tt]2i)(.*)$"
  },
  run = run,
  }
end
-- by  @MoonsTeam
