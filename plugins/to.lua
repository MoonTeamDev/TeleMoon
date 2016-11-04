
do 
-------------------------- 
local function topng(msg, success, result) 
  local receiver = get_receiver(msg) 
  if success then 
    local file = './data/topng/'..msg.from.id..'.png' 
    print('File downloaded to:', result) 
    os.rename(result, file) 
    print('File moved to:', file) 
    send_document(get_receiver(msg), file, ok_cb, false) 
    redis:del("photo:png") 
  else 
    print('Error downloading: '..msg.id) 
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false) 
  end 
end 
----------------------- 
local function toaudio(msg, success, result) 
  local receiver = get_receiver(msg) 
  if success then 
    local file = './data/toaudio/'..msg.from.id..'.mp3' 
    print('File downloaded to:', result) 
    os.rename(result, file) 
    print('File moved to:', file) 
    send_audio(get_receiver(msg), file, ok_cb, false) 
    redis:del("video:audio") 
  else 
    print('Error downloading: '..msg.id) 
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false) 
  end 
end 
----------------------- 

local function tomkv(msg, success, result) 
  local receiver = get_receiver(msg) 
  if success then 
    local file = './data/tomkv/'..msg.from.id..'.mkv' 
    print('File downloaded to:', result) 
    os.rename(result, file) 
    print('File moved to:', file) 
    send_document(get_receiver(msg), file, ok_cb, false) 
    redis:del("video:document") 
  else 
    print('Error downloading: '..msg.id) 
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false) 
  end 
end 
----------------------- 

local function togif(msg, success, result) 
  local receiver = get_receiver(msg) 
  if success then 
    local file = './data/togif/'..msg.from.id..'.mp4' 
    print('File downloaded to:', result) 
    os.rename(result, file) 
    print('File moved to:', file) 
    send_document(get_receiver(msg), file, ok_cb, false) 
    redis:del("video:gif") 
  else 
    print('Error downloading: '..msg.id) 
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false) 
  end 
end 
----------------------- 
local function tovideo(msg, success, result) 
  local receiver = get_receiver(msg) 
  if success then 
    local file = './data/tovideo/'..msg.from.id..'.gif' 
    print('File downloaded to:', result) 
    os.rename(result, file) 
    print('File moved to:', file) 
    send_video(get_receiver(msg), file, ok_cb, false) 
    redis:del("gif:video") 
  else 
    print('Error downloading: '..msg.id) 
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false) 
  end 
end 
----------------------- 
local function toimage(msg, success, result) 
  local receiver = get_receiver(msg) 
  if success then 
    local file = './data/tophoto/'..msg.from.id..'.jpg' 
    print('File downloaded to:', result) 
    os.rename(result, file) 
    print('File moved to:', file) 
    send_photo(get_receiver(msg), file, ok_cb, false) 
    redis:del("sticker:photo") 
  else 
    print('Error downloading: '..msg.id) 
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false) 
  end 
end 
----------------------- 
local function tosticker(msg, success, result) 
  local receiver = get_receiver(msg) 
  if success then 
    local file = './data/tosticker/'..msg.from.id..'.webp' 
    print('File downloaded to:', result) 
    os.rename(result, file) 
    print('File moved to:', file) 
    send_document(get_receiver(msg), file, ok_cb, false) 
    redis:del("photo:sticker") 
  else 
    print('Error downloading: '..msg.id) 
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false) 
  end 
end 

------------------------
 local receiver = get_receiver(msg) 
    local group = msg.to.id 
    if msg.reply_id then 
       if msg.to.type == 'document' and redis:get("sticker:photo") then 
        if redis:set("sticker:photo", "waiting") then 
        end 
       end 
      if matches[1]:lower() == "photo" then 
     redis:get("sticker:photo") 
    send_large_msg(receiver, '', ok_cb, false) 
        load_document(msg.reply_id, toimage, msg) 
    end 
end 
------------------------ 
       local receiver = get_receiver(msg) 
    local group = msg.to.id 
    if msg.reply_id then 
       if msg.to.type == 'photo' and redis:get("photo:sticker") then 
        if redis:set("photo:sticker", "waiting") then 
        end 
       end 
      if matches[1]:lower() == "sticker"  then 
     redis:get("photo:sticker") 
    send_large_msg(receiver, '', ok_cb, false) 
        load_photo(msg.reply_id, tosticker, msg) 
    end 
end
------------------------- 
local receiver = get_receiver(msg) 
    local group = msg.to.id 
    if msg.reply_id then 
       if msg.to.type == 'video' and redis:get("video:audio") then 
        if redis:set("video:audio", "waiting") then 
        end 
       end 
      if matches[1]:lower() == "audio"  then 
     redis:get("video:audio") 
    send_large_msg(receiver, '', ok_cb, false) 
        load_audio(msg.reply_id, toaudio, msg) 
    end 
end 
----------------------- 

local receiver = get_receiver(msg) 
    local group = msg.to.id 
    if msg.reply_id then 
       if msg.to.type == 'document' and redis:get("gif:video") then 
        if redis:set("gif:video", "waiting") then 
        end 
       end 
      if matches[1]:lower() == "video"  then 
     redis:get("gif:video") 
    send_large_msg(receiver, '', ok_cb, false) 
        load_document(msg.reply_id, tovideo, msg) 
    end 
end 
------------------------ 
local receiver = get_receiver(msg) 
    local group = msg.to.id 
    if msg.reply_id then 
       if msg.to.type == 'video' and redis:get("video:document") then 
        if redis:set("video:document", "waiting") then 
        end 
       end 
      if matches[1]:lower() == "mkv"  then 
     redis:get("video:document") 
    send_large_msg(receiver, '', ok_cb, false) 
        load_video(msg.reply_id, tomkv, msg) 
    end 
end 
------------------------ 
local receiver = get_receiver(msg) 
    local group = msg.to.id 
    if msg.reply_id then 
       if msg.to.type == 'video' and redis:get("video:gif") then 
        if redis:set("video:gif", "waiting") then 
        end 
       end 
      if matches[1]:lower() == "gif"  then 
     redis:get("video:gif") 
    send_large_msg(receiver, '', ok_cb, false) 
        load_video(msg.reply_id, togif, msg) 
    end 
end 
------------------------ 
local receiver = get_receiver(msg) 
    local group = msg.to.id 
    if msg.reply_id then 
       if msg.to.type == 'photo' and redis:get("photo:sticker") then 
        if redis:set("photo:png", "waiting") then 
        end 
       end 
      if matches[1]:lower() == "png"  then 
     redis:get("photo:png") 
    send_large_msg(receiver, '', ok_cb, false) 
        load_photo(msg.reply_id, topng, msg) 
    end 
end 
--------------------------- 
if matches[1] == "stickerpro" then 
local text1 = "" 
local text2 = matches[2] 
local text3 = matches[3] 
if not matches[2] then 
  text2 = " " 
  end 
if not matches[3] then 
  text3 = " " 
  end 
if not matches[2] and not matches[3] then 
  text2 = " " 
  text3 = " " 
  end 
  text4 = "[pika]" 
  local url = URL.escape(text1.." "..text2.." "..text3) 
  local answers = {'https://assets.imgix.net/examples/clouds.jpg?blur=200&w=1300&h=600&fit=crop&txt=', 
                   'https://assets.imgix.net/examples/redleaf.jpg?blur=200&w=1300&h=600&fit=crop&txt=', 
                   'https://assets.imgix.net/examples/blueberries.jpg?blur=200&w=1300&h=600&fit=crop&txt=', 
                   'https://assets.imgix.net/examples/butterfly.jpg?blur=200&w=1300&h=600&fit=crop&txt=', 
                   'https://assets.imgix.net/examples/espresso.jpg?blur=200&w=1000&h=400&fit=crop&txt=', 
                   'https://assets.imgix.net/unsplash/transport.jpg?blur=200&w=1300&h=600&fit=crop&txt=', 
                   'https://assets.imgix.net/unsplash/coffee.JPG?blur=200&w=1300&h=600&fit=crop&txt=', 
                   'https://assets.imgix.net/unsplash/citystreet.jpg?blur=200&w=1300&h=600&fit=crop&txt=', 
       'http://assets.imgix.net/examples/vista.png?blur=200&w=1300&h=600&fit=crop&txt='} 
local fonts = {'American%20Typewriter%2CBold','Arial%2CBoldItalicMT','Arial%2CBoldMT','Athelas%2CBold', 
               'Baskerville%2CBoldItalic','Charter%2CBoldItalic','DIN%20Alternate%2CBold','Gill%20Sans%2CUltraBold', 
      'PT%20Sans%2CBold','Seravek%2CBoldItalic','Verdana%2CBold','Yuanti%20SC%2CBold','Avenir%20Next%2CBoldItalic', 
      'Lucida%20Grande%2CBold','American%20Typewriter%20Condensed%2CBold','rial%20Rounded%20MT%2CBold','Chalkboard%20SE%2CBold', 
      'Courier%20New%2CBoldItalic','Charter%20Black%2CItalic','American%20Typewriter%20Light'} 
local colors = {'00FF00','6699FF','CC99CC','CC66FF','0066FF','000000','CC0066','FF33CC','FF0000','FFCCCC','FF66CC','33FF00','FFFFFF','00FF00'} 
local f = fonts[math.random(#fonts)] 
local c = colors[math.random(#colors)] 
local url = answers[math.random(#answers)]..url.."&txtsize=120&txtclr="..c.."&txtalign=middle,center&txtfont="..f.."%20Condensed%20Medium&mono=ff6598cc=?markscale=60&markalign=center%2Cdown" 
local randoms = math.random(1000,900000) 
local randomd = randoms..".webp" 
local cb_extra = {file_path=file} 
local receiver = get_receiver(msg) 
local file = download_to_file(url,randomd) 
 send_document(receiver, file, rmtmp_cb, cb_extra) 
end 
-------------------------- 
if matches[1] == "imagepro" then 
local text1 = "" 
local text2 = matches[2] 
local text3 = matches[3] 
if not matches[2] then 
  text2 = " " 
  end 
if not matches[3] then 
  text3 = " " 
  end 
if not matches[2] and not matches[3] then 
  text2 = " " 
  text3 = " " 
  end 
  text4 = "[pika]" 
  local url = URL.escape(text1.." "..text2.." "..text3) 
  local answers = {'https://assets.imgix.net/examples/clouds.jpg?blur=200&w=1300&h=600&fit=crop&txt=', 
                   'https://assets.imgix.net/examples/redleaf.jpg?blur=200&w=1300&h=600&fit=crop&txt=', 
                   'https://assets.imgix.net/examples/blueberries.jpg?blur=200&w=1300&h=600&fit=crop&txt=', 
                   'https://assets.imgix.net/examples/butterfly.jpg?blur=200&w=1300&h=600&fit=crop&txt=', 
                   'https://assets.imgix.net/examples/espresso.jpg?blur=200&w=1000&h=400&fit=crop&txt=', 
                   'https://assets.imgix.net/unsplash/transport.jpg?blur=200&w=1300&h=600&fit=crop&txt=', 
                   'https://assets.imgix.net/unsplash/coffee.JPG?blur=200&w=1300&h=600&fit=crop&txt=', 
                   'https://assets.imgix.net/unsplash/citystreet.jpg?blur=200&w=1300&h=600&fit=crop&txt=', 
       'http://assets.imgix.net/examples/vista.png?blur=200&w=1300&h=600&fit=crop&txt='} 
local fonts = {'American%20Typewriter%2CBold','Arial%2CBoldItalicMT','Arial%2CBoldMT','Athelas%2CBold', 
               'Baskerville%2CBoldItalic','Charter%2CBoldItalic','DIN%20Alternate%2CBold','Gill%20Sans%2CUltraBold', 
      'PT%20Sans%2CBold','Seravek%2CBoldItalic','Verdana%2CBold','Yuanti%20SC%2CBold','Avenir%20Next%2CBoldItalic', 
      'Lucida%20Grande%2CBold','American%20Typewriter%20Condensed%2CBold','rial%20Rounded%20MT%2CBold','Chalkboard%20SE%2CBold', 
      'Courier%20New%2CBoldItalic','Charter%20Black%2CItalic','American%20Typewriter%20Light'} 
local colors = {'00FF00','6699FF','CC99CC','CC66FF','0066FF','000000','CC0066','FF33CC','FF0000','FFCCCC','FF66CC','33FF00','FFFFFF','00FF00'} 
local f = fonts[math.random(#fonts)] 
local c = colors[math.random(#colors)] 
local url = answers[math.random(#answers)]..url.."&txtsize=120&txtclr="..c.."&txtalign=middle,center&txtfont="..f.."%20Condensed%20Medium&mono=ff6598cc=?markscale=60&markalign=center%2Cdown" 
local randoms = math.random(1000,900000) 
local randomd = randoms..".jpg" 
local cb_extra = {file_path=file} 
local receiver = get_receiver(msg) 
local file = download_to_file(url,randomd) 
 send_photo(receiver, file, rmtmp_cb, cb_extra) 
end 
return { 
patterns = {  
   "^[#!/]([Ss]ticker)$", 
   "^[#!/](photo)$", 
   "^[#!/](gif)$", 
   "^[#!/](video)$", 
   "^[#!/](mkv)$", 
   "^[#!/](audio)$", 
   "^[#!/](stickerpro) (.+)$",  
"^[#!/](stickerpro) (.+) (.+)$", 
"^[#!/](stickerpro) (.+) (.+) (.+)$", 
"^[#!/](stickerpro) (.+) (.+) (.+) (.+)$", 
"^[#!/](imagepro) (.+)$", 
"^[#!/](imagepro) (.+) (.+)$", 
"^[#!/](imagepro) (.+) (.+) (.+)$", 
"^[#!/](imagepro) (.+) (.+) (.+) (.+)$", 
"^[#!/](png)$", 
   "%[(document)%]", 
   "%[(photo)%]", 
"%[(video)%]", 
   "%[(audio)%]", 
 }, 
run = run, 
} 

-- by @MoonTeam
