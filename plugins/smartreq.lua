local function run(msg, matches)
local txt = "🇮🇷 درخواست گروه 7 روزه شما به تیم مدیریت ارسال شد \n 🇮🇷Your Id :"..msg.from.id.."\n🇮🇷Your username :"..msg.from.username.."\n🇮🇷You will be Mention by admin for your request ‼️"
local txt2 = "🇮🇷 درخواست گروه 30 روزه شما به تیم مدیریت ارسال شد \n 🇮🇷Your Id :"..msg.from.id.."\n🇮🇷Your username :"..msg.from.username.."\n🇮🇷You will be Mention by admin for your request ‼️"
local txt3 = "🇮🇷 درخواست گروه بی نهایت شما به تیم مدیریت ارسال شد \n 🇮🇷Your Id :"..msg.from.id.."\n🇮🇷Your username :"..msg.from.username.."\n🇮🇷You will be Mention by admin for your request ‼️"
local chat = '90285047'
local text = "درخواست گروه 7 روزه از طرف"..msg.from.username.."🇮🇷"
local text2 = "درخواست گروه 30 روزه از طرف"..msg.from.username.."🇮🇷"
local text3 = "درخواست گروه بی نهایت از طرف"..msg.from.username.."🇮🇷"

if matches[1] == "group" and matches[2] == "1" then
 send_large_msg(chat, text, ok_cb, false)
 return txt
 end
 if matches[1] == "group" and matches[2] == "2" then
 send_large_msg(chat, text2, ok_cb, false)
 return txt2
 end
 if matches[1] == "group" and matches[2] == "3" then
 send_large_msg(chat, text3, ok_cb, false)
 return txt3
 end

 return {
     patterns = {
  "^[!/#]([Gg]roup) (1)$",
    "^[!/#]([Gg]roup) (2)$",
     "^[!/#]([Gg]roup) (3)$",
  },
    run = run
    }
    end
