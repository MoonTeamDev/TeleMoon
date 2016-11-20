local function run(msg, matches ) 
  if matches[1] == "phone" then
    return "Number: +"..(msg.from.number or "")
  end
end

return {
  patterns ={
    "^[/! #](phone)$" 
 }, 
  run = run 
}
