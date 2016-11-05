local function run(msg,matches)
   local n =  string.len(matches[1])
       return n
end
return {
patterns = {
"[/!#]count +(.*)"
},
run = run
}
