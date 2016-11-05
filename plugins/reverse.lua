local function beyondteam(msg,matches)
   local m =  string.reverse(matches[1])
       return m
end
return {
patterns = {
"[/!#]reverse +(.*)"
},
run = beyondteam
}
