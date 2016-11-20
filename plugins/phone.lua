local function run(msg, matches ) 
  if matches[1] == "phone" then
    return "Number: +"..(number or "")
  end
end

return {
  patterns ={
    "^[/! #](phone)$" 
 }, 
  run = run 
}
