function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

local function run(msg, matches)
local url = 'https://tarfandbazar.ir/API/index.php?arz=true'
  local jstr, res = https.request(url)
  local arz = json:decode(jstr)
  local cruel = 'مبلغ مورد نظر شما : '..matches[2]..' تومان'
local dollar = matches[2] / arz.dollar.value  
  local dollar_rasmi = matches[2] / arz.dollar_rasmi.value
  local euro = matches[2] / arz.euro.value
  local derham = matches[2] / arz.derham.value
  local pond = matches[2] / arz.pond.value
  if matches[1] == 'earz' then
 cruel = cruel..'\nمعادل '..round(dollar,2)..' 💸دلار'
 cruel = cruel..'\nمعادل '.. round(dollar_rasmi,2)..' 💵دلار رسمی'
 cruel = cruel..'\nمعادل '..round(euro,2) ..' 💶یورو'
 cruel = cruel..'\nمعادل '..round(derham,2) ..' 💴درهم'
 cruel = cruel..'\nمعادل '..round(pond,2) ..' 💷پوند میباشد'
    

return cruel
end
end


return {

  patterns = {

"^[/#!](earz) (%d+)$"
  }, 
  run = run 
}
