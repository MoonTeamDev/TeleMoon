local function run(msg, matches)
	if not is_owner(msg) then
		return "فقط برای صاحب گروه" 
	end
	if #matches < 2 then
		return "بعد از این دستور، با قید یک فاصله کلمه یا جمله ی مورد نظر را جهت زیبا نویسی وارد کنید"
	end
	if string.len(matches[2]) > 20 then
		return "حداکثر حروف مجاز 20 کاراکتر انگلیسی و عدد است"
	end
	local font_base = "ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_"

	local font_hash = "ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_"
	local fonts = {
		
"ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_",
		
"ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_",
		
"ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_",
		
"ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_",
		
"ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_",
		
"ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_",		

"ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_",
		
"ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_",
		
"ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_",
		
"ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_",
		
"ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_",
		
"ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_",
		
"ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_",
		
"ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_",
		
"ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_",
		
"ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_",
		
""ض,ص,ق,ف,غ,ع,ه,خ,ح,ج,ش,س,ی,ب,ل,ا,ن,ت,م,چ,ظ,ط,ز,ر,د,پ,و,ک,گ,ث,ژ,ذ,آ,ئ,.,_",
	}
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	local result = {}
	i=0
	for k=1,#fonts do
		i=i+1
		local tar_font = fonts[i]:split(",")
		local text = matches[2]
		local text = text:gsub("ض",tar_font[1])
		local text = text:gsub("ص",tar_font[2])
		local text = text:gsub("ق",tar_font[3])
		local text = text:gsub("ف",tar_font[4])
		local text = text:gsub("غ",tar_font[5])
		local text = text:gsub("ع",tar_font[6])
		local text = text:gsub("ه",tar_font[7])
		local text = text:gsub("خ",tar_font[8])
		local text = text:gsub("ح",tar_font[9])
		local text = text:gsub("ج",tar_font[10])
		local text = text:gsub("ش",tar_font[11])
		local text = text:gsub("س",tar_font[12])
		local text = text:gsub("ی",tar_font[13])
		local text = text:gsub("ب",tar_font[14])
		local text = text:gsub("ل",tar_font[15])
		local text = text:gsub("ا",tar_font[16])
		local text = text:gsub("ن",tar_font[17])
		local text = text:gsub("ت",tar_font[18])
		local text = text:gsub("م",tar_font[19])
		local text = text:gsub("چ",tar_font[20])
		local text = text:gsub("ظ",tar_font[21])
		local text = text:gsub("ط",tar_font[22])
		local text = text:gsub("ز",tar_font[23])
		local text = text:gsub("ر",tar_font[24])
		local text = text:gsub("د",tar_font[25])
		local text = text:gsub("پ",tar_font[26])
		local text = text:gsub("و",tar_font[27])
		local text = text:gsub("ک",tar_font[28])
		local text = text:gsub("گ",tar_font[29])
		local text = text:gsub("ث",tar_font[30])
		local text = text:gsub("ژ",tar_font[31])
		local text = text:gsub("ذ",tar_font[32])
		local text = text:gsub("ئ",tar_font[33])
		local text = text:gsub("آ",tar_font[34])

		table.insert(result, text)
	end
	local result_text = "کلمه ی اولیه: "..matches[2].."\nطراحی با "..tostring(#fonts).." فونت:\n______________________________\n"
	a=0
	for v=1,#result do
		a=a+1
		result_text = result_text..a.."- "..result[a].."\n\n"
	end
	return result_text.."______________________________\n@MoonsTeam"
end

return {
	description = "Fantasy Writer",
	usagehtm = '<tr><td align="center">write متن</td><td align="right">با استفاده از این پلاگین میتوانید متون خود را با فونت های متنوع و زیبایی طراحی کنید. حد اکثر کاراکتر های مجاز 20 عدد میباشد و فقط میتوانید از حروف انگلیسی و اعداد استفاده کنید</td></tr>',
	usage = {"write [text] : زیبا نویسی",},
	patterns = {
		"^([Ww]rite) (.*)",
		"^([Ww]rite)$",
		},
	run = run
}
