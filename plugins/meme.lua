local function run(msg, matches)
 if matches[2] == 'bob' then
 meme = '3287048'
 end
 if matches[2] == 'cat' then
 meme = '6541210'
 end
 if matches[2] == '12' then
 meme = '15512432'
 end
  local text = URL.escape(matches[3])
  local text2 = ' '
  if matches[4] then
  local text2 = URL.escape(matches[4])
  end
  local url = 'https://cdn.meme.am/Instance/Preview?imageID='..meme..'&generatorTypeID=&panels=&text0='..text..'&text1='..text2
  		 local  file = download_to_file(url,'meme.webp')
			send_document(get_receiver(msg), file, ok_cb, false)
end 
return {
  usage = ' ',
  patterns = {
    "[/!#]^([Mm]eme) ([Bb]ob) (.*)$",
	"^[/!#]([Mm]eme) ([Bb]ob) (.*) + (.*)$",
	"^[/!#]([Mm]eme) ([Cc]at) (.*)$",
	"^[/!#]([Mm]eme) ([Cc]at) (.*) + (.*)$",
	"^[/!#]([Mm]eme) (test) (.*)$",
	"^[/!#]([Mm]eme) (test) (.*) + (.*)$",
	
  },
  run = run
}
--by @MoonsTeam
