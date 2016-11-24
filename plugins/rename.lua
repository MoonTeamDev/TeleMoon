local function run(msg, matches)
      return 'Group name changed to: '..msg.to.print_name..' By '..msg.from.print_name..'تغییر یافت'
end

return {
    patterns = {
        "^!!tgservice chat_rename$",
    },
    run = run
}
