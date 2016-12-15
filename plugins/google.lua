local function run(msg,matches)
local url = https.request("https://irapi.ir/google/api.php?txt="..URL.escape(matches[1]))
local jdat = json:decode(url)
local text = ""
text = text.."Subject : "..jdat.text1.."\nLink : "..jdat.link1.."\n\n"
text = text.."Subject : "..jdat.text2.."\nLink : "..jdat.link2.."\n\n"
text = text.."Subject : "..jdat.text3.."\nLink : "..jdat.link3.."\n\n"
text = text.."Subject : "..jdat.text4.."\nLink : "..jdat.link4.."\n\n"
text = text.."Subject : "..jdat.text5.."\nLink : "..jdat.link5.."\n\n"
text = text.."Subject : "..jdat.text6.."\nLink : "..jdat.link6.."\n\n"
text = text.."Subject : "..jdat.text7.."\nLink : "..jdat.link7.."\n\n"
text = text.."Subject : "..jdat.text8.."\nLink : "..jdat.link8.."\n\n"
text = text.."Subject : "..jdat.text9.."\nLink : "..jdat.link9.."\n\n"
text = text.."Subject : "..jdat.text10.."\nLink : "..jdat.link10.."\n\n"
return text
end

return {
patterns = { "^[#!/][Gg]oogle (.*)$"},
run = run
}
--by @MoonsTeam , @Makan
