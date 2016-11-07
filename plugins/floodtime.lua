local function pre_process(msg)
local chat_id = msg.to.id
local user_id = msg.from.id
  if msg.service then
    return msg
  end

    local hash = 'flood_time'
    if not redis:get(hash) then
        TIME_CHECK = 3
    else
        TIME_CHECK = tonumber(redis:get(hash))
    end
    if msg.to.type == 'user' then
        --Checking flood
        local hashse = 'anti-flood'
        if not redis:get(hashse) then
            print('anti-flood enabled')
            -- Check flood
            if msg.from.type == 'user' then
                if not is_sudo(msg) then
                    -- Increase the number of messages from the user on the chat
                    local hash = 'flood:'..user_id..':msg-number'
                    local msgs = tonumber(redis:get(hash) or 0)
                    if msgs > MSG_NUM_MAX then
if redis:get('user:'..user_id..':flooder') then
return
else
    reply_msg(msg.id, "You are blocked because of flooding!", ok_cb, true)
block_user("user#id"..user_id,ok_cb,false)
send_large_msg("user#id"..our_id,'User [ '..('@'..msg.from.username or msg.from.first_name)..' ] '..msg.from.id..' has been blocked because of flooding!')
redis:setex('user:'..user_id..':flooder', 30, true)
                       end
                    end
                    redis:setex(hash, TIME_CHECK, msgs+1)
                end
return {
    patterns = {
        "^[!/#](floodtime) (%d+)$",
    },
      run = run,
pre_process = pre_process
}
end
