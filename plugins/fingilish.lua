local function run(msg, matches)
local text = URL.escape(matches[2])
  local url = 'https://irapi.ir/finglish/api.php?text='..text
  local jdat = json:decode(url)
  return jdat.fin
 end
return {
  usage = '',
  patterns = {
    "^[/!#](fin) (.*)$",
	
  },
  run = run
}
