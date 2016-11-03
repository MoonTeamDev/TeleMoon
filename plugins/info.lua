
do
local Arian = 90285047

local function setrank(msg, name, value,receiver) -- setrank function
  local hash = nil

    hash = 'rank:variables'

  if hash then
    redis:hset(hash, name, value)
	return send_msg(receiver, '('..name..') Rank changed to: '..value..'', ok_cb,  true)
  end
end


local function res_user_callback(extra, success, result) -- /info <username> function
  if success == 1 then  
  if result.username then
   Username = '@'..result.username
   else
   Username = '----'
  end
    local text = 'Full name : '..(result.first_name or '')..' '..(result.last_name or '')..'\n'
               ..'Username: '..Username..'\n'
               ..'Id: '..result.peer_id..'\n\n'
	local hash = 'rank:variables'
	local value = redis:hget(hash, result.peer_id)
    if not value then
	 if result.peer_id == tonumber(Arian) then
	   text = text..'Rank: Sudo \n\n'
	  elseif is_admin2(result.peer_id) then
	   text = text..'Rank: Admin \n\n'
	  elseif is_owner2(result.peer_id, extra.chat2) then
	   text = text..'Rank: Owner \n\n'
	  elseif is_momod2(result.peer_id, extra.chat2) then
	    text = text..'Rank: Moderator \n\n'
      else
	    text = text..'Rank: User \n\n'
	 end
   else
   text = text..'Rank: '..value..'\n\n'
  end
  local uhash = 'user:'..result.peer_id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..result.peer_id..':'..extra.chat2
  user_info_msgs = tonumber(redis:get(um_hash) or 0)
  text = text..'User msgs: : '..user_info_msgs..'\n\n'
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
   local text = 'Full name: '..(result.first_name or '')..' '..(result.last_name or '')..'\n'
               ..'Username: '..Username..'\n'
               ..'Id: '..result.peer_id..'\n\n'
  local hash = 'rank:variables'
  local value = redis:hget(hash, result.peer_id)
  if not value then
	 if result.peer_id == tonumber(Arian) then
	   text = text..'Rank: Sudo \n\n'
	  elseif is_admin2(result.peer_id) then
	   text = text..'Rank: Admin \n\n'
	  elseif is_owner2(result.peer_id, extra.chat2) then
	   text = text..'Rank: Owner \n\n'
	  elseif is_momod2(result.peer_id, extra.chat2) then
	   text = text..'Rank: Moderator \n\n'
	  else
	   text = text..'Rank: User \n\n'
	  end
   else
    text = text..'Rank: '..value..'\n\n'
  end
  local uhash = 'user:'..result.peer_id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..result.peer_id..':'..extra.chat2
  user_info_msgs = tonumber(redis:get(um_hash) or 0)
  text = text..'User msgs: '..user_info_msgs..'\n\n'
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
				msg_type = "Sticker"
			else
				msg_type = "Files"
			end
		elseif result.media.type == "photo" then
			msg_type = "Photo"
		elseif result.media.type == "video" then
			msg_type = "Video"
		elseif result.media.type == "audio" then
			msg_type = "Audio"
		elseif result.media.type == "geo" then
			msg_type = "Location"
		elseif result.media.type == "contact" then
			msg_type = "Contact"
		elseif result.media.type == "file" then
			msg_type = "File"
		elseif result.media.type == "webpage" then
			msg_type = "Webpage"
		elseif result.media.type == "unsupported" then
			msg_type = "Gif"
		else
			msg_type = "?"
		end
	elseif result.text then
		if string.match(result.text, '^%d+$') then
			msg_type = "Number"
		elseif string.match(result.text, '%d+') then
			msg_type = "Number and script"
		elseif string.match(result.text, '^@') then
			msg_type = "Username"
		elseif string.match(result.text, '@') then
			msg_type = "Username"
		elseif string.match(result.text, '[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]') then
			msg_type = "Telegram links"
elseif string.match(result.text, '[Hh][Tt][Tt][Pp]') then
			msg_type = "Telegram or site links"
		elseif string.match(result.text, '[Ww][Ww][Ww]') then
			msg_type = "Site links"
		elseif string.match(result.text, '?') then
			msg_type = "Question"
		else
			msg_type = "Text"
		end
	end
if result.from.phone then
				numberorg = string.sub(result.from.phone, 3)
				number = "****0"..string.sub(numberorg, 0,6)
				if string.sub(result.from.phone, 0,2) == '98' then
					number = number.."\nLocation: iran islamic"
					if string.sub(result.from.phone, 0,4) == '9891' then
						number = number.."\nSim: ir-mci"
					elseif string.sub(result.from.phone, 0,5) == '98932' then
						number = number.."\nSim: talia"
					elseif string.sub(result.from.phone, 0,4) == '9893' then
						number = number.."\nSim: irancell"
					elseif string.sub(result.from.phone, 0,4) == '9890' then
						number = number.."\nSim: irancell"
					elseif string.sub(result.from.phone, 0,4) == '9892' then
						number = number.."\nSim: rightel"
					else
						number = number.."\nSim: ?"
					end
elseif string.sub(result.from.phone, 0,2) == '63' then
					number = number.."\nLocation: philipins"
				elseif string.sub(result.from.phone, 0,2) == '62' then
					number = number.."\nLocation: indonesia"
elseif string.sub(result.from.phone, 0,1) == '1' then
					number = number.."\nLocation: usa/canada"
				else
					number = number.."\nLocation: ?\nSim: ?"
				end
			else
				number = "-----"
			end

  local text = 'Full name: '..(result.from.first_name or '')..' '..(result.from.last_name or '')..'\n'
               ..'Username: '..Username..'\n\n'
local text = text..'Phone number: '..number..'\n\n'
local text = text..'Msg: '..msg_type..'\n\n'
               ..'Id: '..result.from.peer_id..'\n\n'
	local hash = 'rank:variables'
		local value = redis:hget(hash, result.from.peer_id)
		 if not value then
		    if result.from.peer_id == tonumber(Arian) then
		       text = text..'Rank: Sudo \n\n'
		     elseif is_admin2(result.from.peer_id) then
		       text = text..'Rank: Admin \n\n'
		     elseif is_owner2(result.from.peer_id, result.to.id) then
		       text = text..'Rank: Owner \n\n'
		     elseif is_momod2(result.from.peer_id, result.to.id) then
		       text = text..'Rank: Moderator \n\n'
		 else
		       text = text..'Rank: User \n\n'
			end
		  else
		   text = text..'Rank: '..value..'\n\n'
		 end
         local user_info = {} 
  local uhash = 'user:'..result.from.peer_id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..result.from.peer_id..':'..result.to.peer_id
  user_info_msgs = tonumber(redis:get(um_hash) or 0)
  text = text..'User msgs: '..user_info_msgs..'\n\n'
local uhash = 'user:'..result.from.peer_id
 	 local user = redis:hgetall(uhash)
  	 local banhash = 'addedbanuser:'..result.to.peer_id..':'..result.from.peer_id
	 user_info_addedbanuser = tonumber(redis:get(banhash) or 0)
text = text..'Add ban user: '..user_info_addedbanuser..'\n\n'
local uhash = 'user:'..result.from.peer_id
 	 local user = redis:hgetall(uhash)
  	 local um_hash = 'gban:spam'..result.from.peer_id
	 user_info_gbanspam = tonumber(redis:get(um_hash) or 0)
	 text = text..'Spam in group: '..user_info_gbanspam..'\n-------------------------------------------------\nℹModerators info\n\n'
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
    return "Sudo only!"
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
					number = number.."\nLocation: iran islamic"
					if string.sub(msg.from.phone, 0,4) == '9891' then
						number = number.."\nSim: ir-mci"
					elseif string.sub(msg.from.phone, 0,5) == '98932' then
						number = number.."\nSim: talia"
					elseif string.sub(msg.from.phone, 0,4) == '9893' then
						number = number.."\nSim: irancell"
					elseif string.sub(msg.from.phone, 0,4) == '9890' then
						number = number.."\nSim: irancell"
					elseif string.sub(msg.from.phone, 0,4) == '9892' then
						number = number.."\nSim: rightel"
					else
						number = number.."\nSim: ?"
					end
elseif string.sub(msg.from.phone, 0,2) == '63' then
					number = number.."\nLocation: philipins"
				elseif string.sub(msg.from.phone, 0,2) == '62' then
					number = number.."\nLocation: indonesia"
elseif string.sub(msg.from.phone, 0,1) == '1' then
					number = number.."\nLocation: usa/canada"
				else
					number = number.."\nLocation: ?\nSim: ?"
				end
			else
				number = "-----"
			end
--------------------
   local text = 'First name: '..(msg.from.first_name or '----')..'\n'
   local text = text..'Last name: '..(msg.from.last_name or '----')..'\n'	
   local text = text..'Username: '..Username..'\n'
   local text = text..'Id: '..msg.from.id..'\n\n'
	  local text = text..'Phone number: '..number..'\n'
	local text = text..'Time: '..jdat.ENtime..'\n'
	local text = text..'Date: '..jdat.ENdate..'\n\n'
   local hash = 'rank:variables'
	if hash then
	  local value = redis:hget(hash, msg.from.id)
	  if not value then
		if msg.from.id == tonumber(Arian) then
		 text = text..'Rank: Sudo \n\n'
		elseif is_admin1(msg) then
		 text = text..'Rank: Admin \n\n'
		elseif is_owner(msg) then
		 text = text..'Rank: Owner \n\n'
		elseif is_momod(msg) then
		 text = text..'Rank: Moderator \n\n'
		else
		 text = text..'Rank: User \n\n'
		end
	  else
	   text = text..'Rank: '..value..'\n'
	  end
	end
	 local uhash = 'user:'..msg.from.id
 	 local user = redis:hgetall(uhash)
  	 local um_hash = 'msgs:'..msg.from.id..':'..msg.to.id
	 user_info_msgs = tonumber(redis:get(um_hash) or 0)
	 text = text..'User msgs: '..user_info_msgs..'\n'
local uhash = 'user:'..msg.from.id
 	 local user = redis:hgetall(uhash)
  	 local um_hash = 'addedbanuser:'..msg.to.id..':'..msg.from.id
	 user_info_addedbanuser = tonumber(redis:get(um_hash) or 0)
text = text..'Add ban user: '..user_info_addedbanuser..'\n'
local uhash = 'user:'..msg.from.id
 	 local user = redis:hgetall(uhash)
  	 local um_hash = 'gban:spam'..msg.from.id
	 user_info_gbanspam = tonumber(redis:get(um_hash) or 0)
	 text = text..'Spam in group: '..user_info_gbanspam..'\n-------------------------------------------------\nℹModerators info\n\n'
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
	 text = text..'Group name: '..msg.to.title..'\n'
     text = text..'Group id: '..msg.to.id..''
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
