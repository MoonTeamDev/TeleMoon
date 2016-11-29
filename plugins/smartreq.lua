local function run(msg, matches)
if matches[1] == 'group' then
local hash = 'Group req:'..msg.from.id
     redis:set(hash, "waite")
      return '🔖کاربر عزیز ('..msg.from.username..')\nشما درخواست گروه ارسال کردید\nبرای گروه 7 روزه عدد 7\nبرای گروه 30 روزه عدد 30\nو برای گروه بدون مدت بی نهایت را ارسال کنید'
    end

    if msg.text then
	local hash = 'Group req:'..msg.from.id
      if msg.text:match("^7$") and redis:get(hash) == "waite" then
	  redis:set(hash, "ok")
	elseif msg.text:match("^30$") and redis:get(hash) == "waite" then
	  redis:set(hash, "ok")
    elseif msg.text:match("^بی نهایت$") and redis:get(hash) == "waite" then
	  redis:set(hash, "ok")

      end
    end
	local text = "درخواست گروه جدید از گروه :"..msg.from.id.."گروه ="
	local hash = 'Group req:'..msg.from.id
	 if redis:get(hash) then
        if redis:get(hash) == "ok" then
		send_large_msg('channel#id90285047', text, ok_cb, false)
         return 'Your #GP req will be check !'
        end
      end
    end

return {
  patterns = {
  "[!/#]group",
  "^7$",
  "^30$",
  "^بی نهایت$"
  },
  run = run,
}
