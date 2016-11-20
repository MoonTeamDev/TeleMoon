do

function run(msg, matches)

local fuse = '⭐Dear makan\n\n#newfeedback \n\nuser ID▶️ : ' .. msg.from.id .. '\n\nGroup ID▶' .. msg.to.id .. '\nName▶ : ' .. msg.from.print_name ..'\n\nusername▶️ :@' .. msg.from.username  ..'\n\n message text:\n\n\n' .. matches[1]
local fuses = '!printf user#id' .. msg.from.id


    local text = matches[1]
 bannedidone = string.find(msg.from.id, '1234567890')
        bannedidtwo =string.find(msg.from.id, '1234567890')
   bannedidthree =string.find(msg.from.id, '1234567890')


        print(msg.to.id)

        if bannedidone or bannedidtwo or bannedidthree then                    --for banned people
                return '❌You are in feedback blacklist!\n talk to @Makan'
 else


                 local sends0 = send_msg('user#90285047', fuse, ok_cb, false)

 return '💡your feedback succesfully recived to @Makan'



end

end
return {
  description = "Feedback",

  usage = "!feedback : send maseage to admins with bot",
  patterns = {
    "^[/#!][Ff]eedback (.*)$"

  },
  run = run
}

end
