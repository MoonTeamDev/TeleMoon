do

function run(msg, matches)
send_contact(get_receiver(msg), "+989379897528", "Makan", ok_cb, false)
end

return {
patterns = {
"^[/#!]sharesudo$"

},
run = run
}

end
