do

function run(msg, matches)

local fuse = '⭐Dear mohamad\n\n#newfeedback \n\nuser ID▶️ : ' .. msg.from.id .. '\n\nGroup ID▶' .. msg.to.id .. '\nName▶ : ' .. msg.from.print_name ..'\n\nusername▶️ :@' .. msg.from.username  ..'\n\n message text ❓\n\n\n' .. matches[1]
local fuses = '!printf user#id' .. msg.from.id


    local text = matches[1]
 bannedidone = string.find(msg.from.id, '88888888')
        bannedidtwo =string.find(msg.from.id, '8888888888')
   bannedidthree =string.find(msg.from.id, '153589494')


        print(msg.to.id)

        if bannedidone or bannedidtwo or bannedidthree then                    --for banned people
                return '❌You are in feedback blacklist!\n talk to @blackwolf_admin'
 else


                 local sends0 = send_msg('user#90285047', fuse, ok_cb, false)

 return '💡your feedback succesfully recived to @blackwolf_admin'



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
