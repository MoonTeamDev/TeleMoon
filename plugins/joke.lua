local database = 'http://vip.opload.ir/vipdl/94/11/amirhmz/'
local function run(msg)
 local res = http.request(database.."joke.db")
 local joke = res:split(",") 
 return joke[math.random(#joke)]
end
return {
 patterns = {
"^[/#!][Jj][Oo][Kk][Ee]$"
},
 run = run
}
