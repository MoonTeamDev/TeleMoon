local function run(msg,matches)
  local m = matches[1]
  local bug = io.popen( 'lua ./plugins/'..m..'.lua' ):read('*all')
  return bug
  end
  
return {
    patterns={
      '^[/#!][Bb][Uu][Gg] (.*)$',
      '^[Bb][Uu][Gg] (.*)$',	  
    },
    run = run
  }
  
