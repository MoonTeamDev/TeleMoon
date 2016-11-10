local function run(msg, matches)
local url = 'http://exchange.nalbandan.com/api.php?action=json'
  local jstr, res = http.request(url)
  local arz = json:decode(jstr)
  local text = 'مبلغ مورد نظر شما : '..matches[2]..' هزار تومان است که '
if matches[1] == 'earz' then
 text = text..'\nمعادل '..arz.dollar.value * matches[2]..' دلار'
 text = text..'\nمعادل '..arz.dollar_rasmi.value * matches[2]..' دلار رسمی'
 text = text..'\nمعادل '..arz.euro.value * matches[2]..' یورو'
 text = text..'\nمعادل '..arz.derham.value * matches[2]..' درهم'
 text = text..'\nمعادل '..arz.pond.value * matches[2]..' پوند میباشد'

return text
end
end


return {

  patterns = {

"^[/#!](earz) (%d+)$"
  }, 
  run = run 
}
