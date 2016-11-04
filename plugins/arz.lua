-- by makan
local function get_arz() 
  local url = 'http://exchange.nalbandan.com/api.php?action=json' 
  local jstr, res = http.request(url) 
  local arz = json:decode(jstr) 
  local channel = '@MoonsTeam' 
  return '📊 نرخ ارز ، طلا و سکه در روز: '..arz.dollar.date..'\n⭐️ سکه طرح قدیم:'..arz.coin_old.value..' تومان\n🌟 سکه طرح جدید:'..arz.coin_new.value..' تومان\n➖➖➖➖➖➖➖➖➖➖➖\n💵 دلـار رسمی:'..arz.dollar_rasmi.value..' تومان\n💵 دلار آمریکا:'..arz.dollar.value..' تومان\n💶 یورو:'..arz.euro.value..' تومان\n💷 پوند:'..arz.pond.value..' تومان\n💰 درهم:'..arz.derham.value..' تومان\n➖➖➖➖➖➖➖➖➖➖➖\n〽️ هر گرم طلای 18 عیار:'..arz.gold_per_geram.value..' تومان\n\n'..channel..'
end 

local function run(msg, matches) 
  local text 
  if matches[1] == 'arz' then 
  text = get_arz() 
elseif matches[1] == 'gold' then 
  text = get_gold() 
elseif matches[1] == 'coin' then 
  text = get_coin() 
  end 
  return text 
end 
return { 
  description = "arz in now", 
  usage = "/arz", 
  patterns = { 
    "^[!/#](arz)$", 
    "^(arz)$" 
  }, 
  run = run 
}
