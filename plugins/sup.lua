do

function run(msg, matches)
    local data = load_data(_config.moderation.data)
      local group_link = data[tostring(1067220916)]['settings']['set_link']
       if not group_link then
      return ''
       end
         local text = "TeleMoon's Support link :\n"..group_link
            return text
end

return {
  patterns = {
    "^[/#!]([Ss]upport)$"
  },
  run = run
}

end
