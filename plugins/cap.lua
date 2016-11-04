local function run(msg, matches)
text = matches[1]
text_upper = string.upper(text)
return text_upper
end

return {
  description = "capital your Message",
  usage = "/cap (message) : reply message",
  patterns = {
    "^[!/]cap +(.+)$"
  }, 
  run = run,
  moderated = true
}
