local function run(msg, matches)
  
    local Store = '🛍Android Store\n\nGoogle Play :\nhttps://play.google.com/store/search?q='..URL.escape(matches[1])
  
    local Store = Store.."\nMobogenie :\nhttp://www.mobogenie.com/search.html?q="..URL.escape(matches[1])
  
    local Store = Store.."\nmobomarket:\nhttp://www.mobomarket.net/search?keyword="..URL.escape(matches[1])
  
    local Store = Store.."\napkmirror :\nhttp://www.apkmirror.com/?s="..URL.escape(matches[1]).."&post_type=app_release&searchtype=apk"
  
    local Store = Store..'\n\n📱Apple store\n\nappsodo :\nhttp://www.appsodo.com/search_'..URL.escape(matches[1]).."_1 \n\n@MoonsTeam"
   
    return Store
end
return {
    patterns = {
        "^[/#!]app (.*)"
    },
run = run
}

--by @MoonsTeam , @Makan
