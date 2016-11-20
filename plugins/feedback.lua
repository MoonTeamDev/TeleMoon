do

function run(msg, matches)

local fuse = 'شما یک پیام جدید دارید \n\nایدی فرد▶️ : ' .. msg.from.id .. '\n\نام فرد▶ : ' .. msg.from.print_name ..'\n\یوزر نیم▶️ :@ ' .. msg.from.username  ..'\n\nپیام️ :\n\n\n' .. matches[1] 
local fuses = '!printf user#id' .. msg.from.id


    local text = matches[1]
 bannedidone = string.find(msg.from.id, '123')
        bannedidtwo =string.find(msg.from.id, '465')       
   bannedidthree =string.find(msg.from.id, '678')  


        print(msg.to.id)

        if bannedidone or bannedidtwo or bannedidthree then                    --for banned people
                return 'شما ازارسال نظر بن شدید'
 else


                 local sends0 = send_msg('chat#90285047', fuse, ok_cb, false)

 return 'پیام شما با موفقیت به تیم قدرتمند صلیب فرستاده شد.'

     

end

end
return {
  description = "Feedback",

  usage = "feedback : پیام خودرا ارسال کنید",
  patterns = {
    "^[Ff]eedback (.*)$"

  },
  run = run
}

end
