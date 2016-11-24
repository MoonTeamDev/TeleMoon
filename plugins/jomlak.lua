local database = 'http://vip.opload.ir/vipdl/95/1/rezasoft80/'
local function run(msg)
 local res = http.request(database.."jomlak.db")
 local jomlak = res:split(",") 
 return jomlak[math.random(#jomlak)]
end
return {
 patterns = {
  "^[!/#](jomlak)$"
  },
 run = run
}
