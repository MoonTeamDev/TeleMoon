local function run (msg,matches)
    local let = string.len(matches[1])
       return "Letters:\n"..let
end
return {patterns = {
    "[/!#]let (.*)"
},
run = run
}
