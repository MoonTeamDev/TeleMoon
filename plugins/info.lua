
do
local Arian = 90285047

local function setrank(msg, name, value,receiver) -- setrank function
  local hash = nil

    hash = 'rank:variables'

  if hash then
    redis:hset(hash, name, value)
	return send_msg(receiver, 'مقام برای  ('..name..') به  : '..value..' تغییر یافت', ok_cb,  true)
  end
end


local function res_user_callback(extra, success, result) -- /info <username> function
  if success == 1 then  
  if result.username then
   Username = '@'..result.username
   else
   Username = '----'
  end
    local text = 'نام کامل : '..(result.first_name or '')..' '..(result.last_name or '')..'\n'
               ..'یوزر نیم: '..Username..'\n'
               ..'ایدی : '..result.peer_id..'\n\n'
	local hash = 'rank:variables'
	local value = redis:hget(hash, result.peer_id)
    if not value then
	 if result.peer_id == tonumber(Arian) then
	   text = text..'مقام : Bot creator \n\n'
	  elseif is_admin2(result.peer_id) then
	   text = text..'مقام : ادمین \n\n'
	  elseif is_owner2(result.peer_id, extra.chat2) then
	   text = text..'مقام : مدیر گروه \n\n'
	  elseif is_momod2(result.peer_id, extra.chat2) then
	    text = text..'مقام : مدیر \n\n'
      else
	    text = text..'مقام : کاربر \n\n'
	 end
   else
   text = text..'مقام : '..value..'\n\n'
  end
  local uhash = 'user:'..result.peer_id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..result.peer_id..':'..extra.chat2
  user_info_msgs = tonumber(redis:get(um_hash) or 0)
  text = text..'تعداد پیام های فرستاده : : '..user_info_msgs..'\n\n'
  text = text
  send_msg(extra.receiver, text, ok_cb,  true)
  else
	send_msg(extra.receiver, ' Username not found.', ok_cb, false)
  end
end

local function action_by_id(extra, success, result)  -- /info <ID> function
 if success == 1 then
 if result.username then
   Username = '@'..result.username
   else
   Username = '----'
 end
   local text = 'نام کامل : '..(result.first_name or '')..' '..(result.last_name or '')..'\n'
               ..'یوزرنیم: '..Username..'\n'
               ..'ایدی : '..result.peer_id..'\n\n'
  local hash = 'rank:variables'
  local value = redis:hget(hash, result.peer_id)
  if not value then
	 if result.peer_id == tonumber(Arian) then
	   text = text..'مقام : BOT Creator \n\n'
	  elseif is_admin2(result.peer_id) then
	   text = text..'مقام : ادمین \n\n'
	  elseif is_owner2(result.peer_id, extra.chat2) then
	   text = text..'مقام : مدیر گروه \n\n'
	  elseif is_momod2(result.peer_id, extra.chat2) then
	   text = text..'مقام : مدیر \n\n'
	  else
	   text = text..'مقام : کاربر \n\n'
	  end
   else
    text = text..'مقام : '..value..'\n\n'
  end
  local uhash = 'user:'..result.peer_id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..result.peer_id..':'..extra.chat2
  user_info_msgs = tonumber(redis:get(um_hash) or 0)
  text = text..'تعداد پیام های کاربر : '..user_info_msgs..'\n\n'
  text = text
  send_msg(extra.receiver, text, ok_cb,  true)
  else
  send_msg(extra.receiver, 'id not found.\nuse : /info @username', ok_cb, false)
  end
end

local function action_by_reply(extra, success, result)-- (reply) /info  function
		if result.from.username then
		   Username = '@'..result.from.username
		   else
		   Username = '----'
		 end

if result.media then
		if result.media.type == "document" then
			if result.media.text then
				msg_type = "استیکر"
			else
				msg_type = "ساير فايلها"
			end
		elseif result.media.type == "photo" then
			msg_type = "فايل عکس"
		elseif result.media.type == "video" then
			msg_type = "فايل ويدئويي"
		elseif result.media.type == "audio" then
			msg_type = "فايل صوتي"
		elseif result.media.type == "geo" then
			msg_type = "موقعيت مکاني"
		elseif result.media.type == "contact" then
			msg_type = "شماره تلفن"
		elseif result.media.type == "file" then
			msg_type = "فايل"
		elseif result.media.type == "webpage" then
			msg_type = "پیش نمایش سایت"
		elseif result.media.type == "unsupported" then
			msg_type = "فايل متحرک"
		else
			msg_type = "ناشناخته"
		end
	elseif result.text then
		if string.match(result.text, '^%d+$') then
			msg_type = "عدد"
		elseif string.match(result.text, '%d+') then
			msg_type = "شامل عدد و حروف"
		elseif string.match(result.text, '^@') then
			msg_type = "یوزرنیم"
		elseif string.match(result.text, '@') then
			msg_type = "شامل یوزرنیم"
		elseif string.match(result.text, '[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]') then
			msg_type = "لينک تلگرام"
elseif string.match(result.text, '[Hh][Tt][Tt][Pp]') then
			msg_type = "لينک سايت"
		elseif string.match(result.text, '[Ww][Ww][Ww]') then
			msg_type = "لينک سايت"
		elseif string.match(result.text, '?') then
			msg_type = "پرسش"
		else
			msg_type = "متن عادی"
		end
	end
if result.from.phone then
				numberorg = string.sub(result.from.phone, 3)
				number = "****0"..string.sub(numberorg, 0,6)
				if string.sub(result.from.phone, 0,2) == '98' then
					number = number.."\nکشور: جمهوری اسلامی ایران"
					if string.sub(result.from.phone, 0,4) == '9891' then
						number = number.."\nنوع سیمکارت: همراه اول"
					elseif string.sub(result.from.phone, 0,5) == '98932' then
						number = number.."\nنوع سیمکارت: تالیا"
					elseif string.sub(result.from.phone, 0,4) == '9893' then
						number = number.."\nنوع سیمکارت: ایرانسل"
					elseif string.sub(result.from.phone, 0,4) == '9890' then
						number = number.."\nنوع سیمکارت: ایرانسل"
					elseif string.sub(result.from.phone, 0,4) == '9892' then
						number = number.."\nنوع سیمکارت: رایتل"
					else
						number = number.."\nنوع سیمکارت: سایر"
					end
elseif string.sub(result.from.phone, 0,2) == '63' then
					number = number.."\nکشور: فیلیپین "
				elseif string.sub(result.from.phone, 0,2) == '62' then
					number = number.."\n کشور: اندونزی "
elseif string.sub(result.from.phone, 0,1) == '1' then
					number = number.."\n کشور: کانادا "
				else
					number = number.."\nکشور: خارج\nنوع سیمکارت: متفرقه"
				end
			else
				number = "-----"
			end

  local text = 'نام کامل : '..(result.from.first_name or '')..' '..(result.from.last_name or '')..'\n'
               ..'یوزرنیم : '..Username..'\n\n'
local text = text..'شماره تلفن : '..number..'\n\n'
local text = text..'نوع متن : '..msg_type..'\n\n'
               ..'ایدی : '..result.from.peer_id..'\n\n'
	local hash = 'rank:variables'
		local value = redis:hget(hash, result.from.peer_id)
		 if not value then
		    if result.from.peer_id == tonumber(Arian) then
		       text = text..'مقام : BOT Creator \n\n'
			   elseif result.peer_id == tonumber(Sosha) then
	           text = text..'مقام : مدیر ارشد ربات (Full Access Admin) \n\n'
	          --elseif result.peer_id == tonumber(Sosha2) then
	          --text = text..'Rank : مدیر ارشد ربات (Full Access Admin) \n\n'
		     elseif is_admin2(result.from.peer_id) then
		       text = text..'مقام : ادمین \n\n'
		     elseif is_owner2(result.from.peer_id, result.to.id) then
		       text = text..'مقام : لیدر گروه \n\n'
		     elseif is_momod2(result.from.peer_id, result.to.id) then
		       text = text..'مقام : مدیر \n\n'
		 else
		       text = text..'مقام : کاربر \n\n'
			end
		  else
		   text = text..'مقام : '..value..'\n\n'
		 end
         local user_info = {} 
  local uhash = 'user:'..result.from.peer_id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..result.from.peer_id..':'..result.to.peer_id
  user_info_msgs = tonumber(redis:get(um_hash) or 0)
  text = text..'⭐تعداد پیام های کاربر : '..user_info_msgs..'\n\n'
local uhash = 'user:'..result.from.peer_id
 	 local user = redis:hgetall(uhash)
  	 local banhash = 'addedbanuser:'..result.to.peer_id..':'..result.from.peer_id
	 user_info_addedbanuser = tonumber(redis:get(banhash) or 0)
text = text..'⭐تعداد خطا در اضافه کردن کاربر بن شده: '..user_info_addedbanuser..'\n\n'
local uhash = 'user:'..result.from.peer_id
 	 local user = redis:hgetall(uhash)
  	 local um_hash = 'gban:spam'..result.from.peer_id
	 user_info_gbanspam = tonumber(redis:get(um_hash) or 0)
	 text = text..'⭐تعداد دفعات اسپم در گروه ها: '..user_info_gbanspam..'\n-------------------------------------------------\nℹModerators info\n\n'
local uhash = 'user:'..result.from.peer_id
local user = redis:hgetall(uhash)
  	 local um_hash = 'kicked:'..result.from.peer_id..':'..result.to.peer_id
	 user_info_kicked = tonumber(redis:get(um_hash) or 0)
text = text..'🔘تعداد افراد اخراج کرده  : '..user_info_kicked..'\n'
local uhash = 'user:'..result.from.peer_id
local user = redis:hgetall(uhash)
  	 local um_hash = 'muted:'..result.from.peer_id..':'..result.to.peer_id
	 user_info_muted = tonumber(redis:get(um_hash) or 0)
text = text..'🔘تعداد افراد سایلنت کرده  : '..user_info_muted..'\n'
local uhash = 'user:'..result.from.peer_id
local user = redis:hgetall(uhash)
  	 local um_hash = 'banned:'..result.from.peer_id..':'..result.to.peer_id
	 user_info_banned = tonumber(redis:get(um_hash) or 0)
text = text..'🔘تعداد افراد بن کرده  : '..user_info_banned..'\n\n'

  text = text
  send_msg(extra.receiver, text, ok_cb, true)
end

local function action_by_reply2(extra, success, result)
local value = extra.value
setrank(result, result.from.peer_id, value, extra.receiver)
end

local function run(msg, matches)
 if matches[1]:lower() == 'setrank' then
  local hash = 'usecommands:'..msg.from.id..':'..msg.to.id
  redis:incr(hash)
  if not is_sudo(msg) then
    return "این دستور فقط برای ادمین های اصلی ربات فعال می باشد"
  end
  local receiver = get_receiver(msg)
  local Reply = msg.reply_id
  if msg.reply_id then
  local value = string.sub(matches[2], 1, 1000)
    msgr = get_message(msg.reply_id, action_by_reply2, {receiver=receiver, Reply=Reply, value=value})
  else
  local name = string.sub(matches[2], 1, 50)
  local value = string.sub(matches[3], 1, 1000)
  local text = setrank(msg, name, value)

  return text
  end
  end
 if matches[1]:lower() == 'info' and not matches[2] then
  local receiver = get_receiver(msg)
  local Reply = msg.reply_id
  if msg.reply_id then
    msgr = get_message(msg.reply_id, action_by_reply, {receiver=receiver, Reply=Reply})
  else
  if msg.from.username then
   Username = '@'..msg.from.username
   else
   Username = '----'
   end
	 local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then return "No connection" end
local jdat = json:decode(url)
-----------
if msg.from.phone then
				numberorg = string.sub(msg.from.phone, 3)
				number = "****0"..string.sub(numberorg, 0,6)
				if string.sub(msg.from.phone, 0,2) == '98' then
					number = number.."\nکشور: جمهوری اسلامی ایران"
					if string.sub(msg.from.phone, 0,4) == '9891' then
						number = number.."\nنوع سیمکارت: همراه اول"
					elseif string.sub(msg.from.phone, 0,5) == '98932' then
						number = number.."\nنوع سیمکارت: تالیا"
					elseif string.sub(msg.from.phone, 0,4) == '9893' then
						number = number.."\nنوع سیمکارت: ایرانسل"
					elseif string.sub(msg.from.phone, 0,4) == '9890' then
						number = number.."\nنوع سیمکارت: ایرانسل"
					elseif string.sub(msg.from.phone, 0,4) == '9892' then
						number = number.."\nنوع سیمکارت: رایتل"
					else
						number = number.."\nنوع سیمکارت: سایر"
					end
elseif string.sub(msg.from.phone, 0,2) == '63' then
					number = number.."\nکشور: فیلیپین "
				elseif string.sub(msg.from.phone, 0,2) == '62' then
					number = number.."\n کشور: اندونزی "
elseif string.sub(msg.from.phone, 0,1) == '1' then
					number = number.."\n کشور: کانادا "
				else
					number = number.."\nکشور: خارج\nنوع سیمکارت: متفرقه"
				end
			else
				number = "-----"
			end
--------------------
   local text = 'نام: '..(msg.from.first_name or '----')..'\n'
   local text = text..'فامیل : '..(msg.from.last_name or '----')..'\n'	
   local text = text..'یوزرنیم : '..Username..'\n'
   local text = text..'ایدی : '..msg.from.id..'\n\n'
	  local text = text..'شماره تلفن : '..number..'\n'
	local text = text..'زمان : '..jdat.FAtime..'\n'
	local text = text..'تاریخ  : '..jdat.FAdate..'\n\n'
   local hash = 'rank:variables'
	if hash then
	  local value = redis:hget(hash, msg.from.id)
	  if not value then
		if msg.from.id == tonumber(Arian) then
		 text = text..'مقام : BOT Creator \n\n'
		elseif is_admin1(msg) then
		 text = text..'مقام : ادمین \n\n'
		elseif is_owner(msg) then
		 text = text..'مقام : مدیر گروه \n\n'
		elseif is_momod(msg) then
		 text = text..'مقام : مدیر \n\n'
		else
		 text = text..'مقام : کاربر \n\n'
		end
	  else
	   text = text..'مقام : '..value..'\n'
	  end
	end
	 local uhash = 'user:'..msg.from.id
 	 local user = redis:hgetall(uhash)
  	 local um_hash = 'msgs:'..msg.from.id..':'..msg.to.id
	 user_info_msgs = tonumber(redis:get(um_hash) or 0)
	 text = text..'⭐تعداد پیام های کاربر: '..user_info_msgs..'\n'
local uhash = 'user:'..msg.from.id
 	 local user = redis:hgetall(uhash)
  	 local um_hash = 'addedbanuser:'..msg.to.id..':'..msg.from.id
	 user_info_addedbanuser = tonumber(redis:get(um_hash) or 0)
text = text..'⭐تعداد خطا در اضافه کردن کاربر بن شده : '..user_info_addedbanuser..'\n'
local uhash = 'user:'..msg.from.id
 	 local user = redis:hgetall(uhash)
  	 local um_hash = 'gban:spam'..msg.from.id
	 user_info_gbanspam = tonumber(redis:get(um_hash) or 0)
	 text = text..'⭐تعداد دفعات اسپم در گروه ها: '..user_info_gbanspam..'\n-------------------------------------------------\nℹModerators info\n\n'
local uhash = 'user:'..msg.from.id
local user = redis:hgetall(uhash)
  	 local um_hash = 'kicked:'..msg.from.id..':'..msg.to.id
	 user_info_kicked = tonumber(redis:get(um_hash) or 0)
text = text..'🔘تعداد افراد اخراج کرده  : '..user_info_kicked..'\n'
local uhash = 'user:'..msg.from.id
local user = redis:hgetall(uhash)
  	 local um_hash = 'muted:'..msg.from.id..':'..msg.to.id
	 user_info_muted = tonumber(redis:get(um_hash) or 0)
text = text..'🔘تعداد افراد سایلنت کرده  : '..user_info_muted..'\n'
local uhash = 'user:'..msg.from.id
local user = redis:hgetall(uhash)
  	 local um_hash = 'banned:'..msg.from.id..':'..msg.to.id
	 user_info_banned = tonumber(redis:get(um_hash) or 0)
text = text..'🔘تعداد افراد بن کرده  : '..user_info_banned..'\n\n'
    if msg.to.type == 'chat' or msg.to.type == 'channel' then
	 text = text..'نام گروه : '..msg.to.title..'\n'
     text = text..'ایدی گروه : '..msg.to.id..''
    end
	text = text
    return reply_msg(msg.id, text, ok_cb, false)
    end
  end
  if matches[1]:lower() == 'info' and matches[2] then
   local user = matches[2]
   local chat2 = msg.to.id
   local receiver = get_receiver(msg)
   if string.match(user, '^%d+$') then
	  user_info('user#id'..user, action_by_id, {receiver=receiver, user=user, text=text, chat2=chat2})
    elseif string.match(user, '^@.+$') then
      username = string.gsub(user, '@', '')
      msgr = res_user(username, res_user_callback, {receiver=receiver, user=user, text=text, chat2=chat2})
   end
  end
end

return {
  description = 'Know your information or the info of a chat members.',
  usage = {
    '!info: Return your info and the chat info if you are in one.',
    '(Reply)!info: Return info of replied user if used by reply.',
    '!info <id>: Return the info\'s of the <id>.',
    '!info @<user_name>: Return the member @<user_name> information from the current chat.',
	'!setrank <userid> <rank>: change members rank.',
	'(Reply)!setrank <rank>: change members rank.',
  },
  patterns = {
    "^[/#!]([Ii][Nn][Ff][Oo])$",
    "^[/!#]([Ii][Nn][Ff][Oo]) (.*)$",
	"^[/!#]([Ss][Ee][Tt][Rr][Aa][Nn][Kk]) (%d+) (.*)$",
	"^[/!#]([Ss][Ee][Tt][Rr][Aa][Nn][Kk]) (.*)$",
  },
  run = run
}

end
